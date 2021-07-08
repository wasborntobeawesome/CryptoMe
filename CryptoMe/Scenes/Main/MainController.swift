//
//  ViewController.swift
//  CryptoMe
//
//  Created by Alimov Islom on 05/07/21.
//

import UIKit
import Moya
import SnapKit

protocol MainDisplayLogic: class {
    func displayItems(viewModel: Main.ShowItems.ViewModel)
}
class MainController: UIViewController {
    let bindingView = MainView()
    
    let interactor: MainBusinessLogic
    var state: Main.ControllerState
    
    var representableViewModels: [MainViewModel]? {
        didSet {
            bindingView.tableView.reloadData()
        }
    }
    
    init(interactor: MainBusinessLogic, initialState: Main.ControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = bindingView
        title = "CryptoMe"
        bindingView.tableView.delegate = self
        bindingView.tableView.dataSource = self
        bindingView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        bindingView.addButton.addTarget(self, action: #selector(handleConnect), for: .touchUpInside)
        bindingView.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        bindingView.refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        display(newState: .loading)
    }
    
    @objc func handleRefresh() {
        interactor.fetchItems(request: .init())
    }
    
    @objc private func handleConnect() {
        let controller = CoinListBuilder().build()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
extension MainController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             interactor.deleteItem(request: .init(text: representableViewModels?[indexPath.row].name))
        }
    }
}

extension MainController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representableViewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = nil
        cell.accessoryView = nil
        cell.textLabel?.text = representableViewModels?[indexPath.row].name
        let moneyLabel = UILabel()
        moneyLabel.text = representableViewModels?[indexPath.row].money
        cell.addSubview(moneyLabel)
        moneyLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        cell.accessoryView = moneyLabel
        return cell
    }
}

extension MainController: MainDisplayLogic {
    func displayItems(viewModel: Main.ShowItems.ViewModel) {
        display(newState: viewModel.state)
    }
    
    func display(newState: Main.ControllerState) {
        switch newState {
        case .emptyResult:
            bindingView.showEmptyState()
        case .loading:
            interactor.fetchItems(request: .init())
        case let .result(items):
            bindingView.refreshControl.endRefreshing()
            bindingView.showTableView()
            representableViewModels = items
            print(items)
        default:
            print("default")
        }
    }
}
