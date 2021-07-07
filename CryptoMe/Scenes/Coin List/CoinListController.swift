//
//  CoinListController.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import UIKit

protocol CoinListDisplayLogic: class {
    func displayItems(viewModel: CoinList.ShowItems.ViewModel)
}

class CoinListController: UIViewController {
    var representableViewModels: [CoinListViewModel]? {
        didSet {
            bindingView.tableVew.reloadData()
        }
    }
    let interactor: CoinListBusinessLogic
    var state: CoinList.ControllerState
    init(interactor: CoinListBusinessLogic, initialState: CoinList.ControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var searchController: UISearchController =  {
        let search = UISearchController()
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        return search
    }()
    
    let bindingView = CoinListView()
    override func loadView() {
        title = "Add coin"
        super.loadView()
        view = bindingView
        setup()
        interactor.fetchItems(request: .init())
    }
    
    func setup() {
        self.navigationItem.searchController = searchController
        bindingView.tableVew.delegate = self
        bindingView.tableVew.dataSource = self
        bindingView.tableVew.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func handleCancel(_ sender: UIButton) {
        
    }
}

extension CoinListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let key = representableViewModels?[indexPath.row].subTitle {
            interactor.selected(request: .init(key: key))
        }
    }
}
extension CoinListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representableViewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = nil
        cell.accessoryView = nil
        cell.selectionStyle  = .none
        cell.textLabel?.text = representableViewModels?[indexPath.row].title
        if let isSelected = representableViewModels?[indexPath.row].isSelected {
            cell.accessoryView = isSelected ? UIImageView(image: UIImage(systemName: "plus")) : nil
        }
        return cell
    }
}

extension CoinListController: CoinListDisplayLogic {
    func displayItems(viewModel: CoinList.ShowItems.ViewModel) {
        switch viewModel.state {
        case let .result(model):
            bindingView.tableVew.backgroundColor = .white
            self.representableViewModels = model
        case .loading:
            bindingView.tableVew.backgroundColor = .red
            self.interactor.fetchItems(request: .init())
        default:
            bindingView.tableVew.backgroundColor = .yellow
            print("VIEWMODEL")
        }
    }
}

extension CoinListController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.showsSearchResultsController = true
        let text = searchController.searchBar.text
        interactor.search(request: .init(text: text))
    }
}
