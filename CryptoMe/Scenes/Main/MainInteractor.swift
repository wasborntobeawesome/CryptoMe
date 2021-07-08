//
//  MainInteractor.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import Foundation
protocol MainBusinessLogic {
    func fetchItems(request: Main.ShowItems.Request)
    func deleteItem(request: Main.ShowItems.Request)
}

class MainInteractor: MainBusinessLogic {

    
    let presenter: MainPresentationLogic
    let provider: ProvidesMainItems
    
    
    init(presenter: MainPresentationLogic, provider: ProvidesMainItems = MainProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func fetchItems(request: Main.ShowItems.Request) {
        provider.getItems { [weak self] items in
            let result: Result<[String: PriceResponse]>
            if let items = items {
                result = .success(items)
            } else {
                result = .failure(Main.ShowItems.Response.Error.emptyState)
            }
            
            self?.presenter.presentItems(response: .init(result: result))
        }
    }
    
    func deleteItem(request: Main.ShowItems.Request) {
        provider.deleteItem(id: request.text!) { [weak self] items in
            let result: Result<[String: PriceResponse]>
            if let items = items {
                result = .success(items)
            } else {
                result = .failure(Main.ShowItems.Response.Error.emptyState)
            }
            
            self?.presenter.presentItems(response: .init(result: result))
        }
    }
}
