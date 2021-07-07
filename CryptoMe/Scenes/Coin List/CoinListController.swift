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
class CoinSearch: UISearchController {
    
}

class CoinListController: UIViewController {
    var representableViewModels: GeneralCoinListResponse? {
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
    
    let searchBar = UISearchBar()
    let searchController = CoinSearch()
    
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
        // let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        // self.navigationItem.rightBarButtonItem = cancelButton
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func handleCancel(_ sender: UIButton) {
        
    }
}

extension CoinListController: UITableViewDelegate {}
extension CoinListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let  count = representableViewModels?.Data.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") as? UITableViewCell else {
        //            return UITableViewCell()
        //        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = indexPath.row.description
        if let value = representableViewModels?.Data {
            let model = value.map({$0.value})
            cell.textLabel?.text = model[indexPath.item]?.Name
        }
        
       // cell.textLabel?.text = key//indexPath.row.description
        return cell
    }
    
    
}

extension CoinListController: CoinListDisplayLogic {
    func displayItems(viewModel: CoinList.ShowItems.ViewModel) {
        switch viewModel.state {
        case let .result(model):
            self.representableViewModels = model
        case .loading:
            self.interactor.fetchItems(request: .init())
        default:
            print("VIEWMODEL")
        }
    }
}
