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
}

class CoinListInteractor: CoinListBusinessLogic {
    let presenter: CoinListPresentationLogic
    let provider: ProvidesCoinListItems
    init(presenter: CoinListPresentationLogic, provider: ProvidesCoinListItems = CoinListProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    func fetchItems(request: CoinList.ShowItems.Request) {
        provider.getItems { items in
            let result: Result<GeneralCoinListResponse>
            if let items = items {
                result = .success(items)

            } else {
                result =  .failure(CoinList.ShowItems.Response.Error.fetchError)
            }
            self.presenter.presentItems(response: .init(result: result))
        }
    }
}
