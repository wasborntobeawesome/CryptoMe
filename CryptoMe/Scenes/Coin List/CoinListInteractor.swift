//
//  CoinListInteractor.swift
//  CryptoMe
//
//  Created by Alimov Islom on 07/07/21.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol CoinListBusinessLogic {
    func fetchItems(request: CoinList.ShowItems.Request)
    func search(request: CoinList.ShowItems.Request)
    func selected(request: CoinList.SelectItems.Request)
    var selectedItems: [String: GeneralCoinResponse] { get }
}

class CoinListInteractor: CoinListBusinessLogic {
    let presenter: CoinListPresentationLogic
    let provider: ProvidesCoinListItems
    
    var listResponse: [String: GeneralCoinResponse]  = [:]
    var selectedItems: [String: GeneralCoinResponse] = [:]
    var searchedItems: [GeneralCoinResponse] = []
    
    init(presenter: CoinListPresentationLogic, provider: ProvidesCoinListItems = CoinListProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func fetchItems(request: CoinList.ShowItems.Request) {
        provider.getItems { items in
            let result: Result<[GeneralCoinResponse]>
            if let items = items {
                self.listResponse = items.data
                let data = self.listResponse.compactMap({$0.value})
                result = .success(data)
            } else {
                result = .failure(CoinList.ShowItems.Response.Error.fetchError)
            }
            self.presenter.presentItems(response: .init(result: result))
        }
    }
    
    func search(request: CoinList.ShowItems.Request) {
        let result: Result<[GeneralCoinResponse]>
        let model = listResponse.compactMap({$0.value})
        if let text = request.text, text.count > 0 {
            let filteredModel = model.filter({$0.fullName.contains(text)})
            searchedItems = filteredModel
            result = filteredModel.isEmpty ? .failure(CoinList.ShowItems.Response.Error.emptySearch) : .success(filteredModel)
        } else {
            searchedItems.removeAll()
            result = .success(model)
        }
        
        self.presenter.presentItems(response: .init(result: result))
    }
    
    func selected(request: CoinList.SelectItems.Request) {
        if let isSelected = listResponse[request.key]?.isSelected {
            selectedItems[request.key] = isSelected ? nil: listResponse[request.key] 
            print(selectedItems)
            listResponse[request.key]?.isSelected = !isSelected
            
        } else {
            selectedItems[request.key] = listResponse[request.key]
            listResponse[request.key]?.isSelected = true
        }
        if searchedItems.isEmpty {
            self.presenter.selectItems(reponse: .init(values: listResponse.compactMap({$0.value}), selectedValues: selectedItems.compactMap({$0.value})))
        self.presenter.presentItems(response: .init(result: .success(listResponse.compactMap({$0.value}))))
        } else {
            for (index, element) in searchedItems.enumerated() {
                if  element.name == request.key {
                    searchedItems[index].isSelected = !(element.isSelected ?? false)
                }
            }
            self.presenter.selectItems(reponse: .init(values: searchedItems, selectedValues: selectedItems.compactMap({$0.value})))
            self.presenter.presentItems(response: .init(result: .success(searchedItems)))
        }
    }
}
