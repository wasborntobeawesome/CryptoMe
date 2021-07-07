//
//  CoinListProvider.swift
//  CryptoMe
//
//  Created by Alimov Islom on 07/07/21.
//

import UIKit

protocol ProvidesCoinListItems {
    func getItems(completion: @escaping (GeneralCoinListResponse?) -> Void)
}

class CoinListProvider: ProvidesCoinListItems {
    let dataStore: StoresCoinListModels
    let service: FetchesCoinListItems
    
    init(dataStore: StoresCoinListModels = CoinListDataStore.shared, service: FetchesCoinListItems = CoinListService()) {
        self.dataStore = dataStore
        self.service = service
    }
    
    func getItems(completion: @escaping (GeneralCoinListResponse?) -> Void) {
        if let model = dataStore.model {
                 return completion(model)
             }
             service.fetchItems { model in
                 self.dataStore.model = model
                 completion(self.dataStore.model)
             }
    }
}
