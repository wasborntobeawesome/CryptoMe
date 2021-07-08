//
//  MainProvider.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import Foundation

protocol ProvidesMainItems {
    func getItems(completion: @escaping ([String: PriceResponse]?) -> Void)
}

struct MainProvider: ProvidesMainItems {
    let dataStore: StoresMainModels
    let service: FetchesMainItems
    
    init(dataStore: StoresMainModels = MainDataStore.shared, service: FetchesMainItems = MainService()) {
        self.dataStore = dataStore
        self.service = service
    }
    
    func getItems(completion: @escaping ([String: PriceResponse]?) -> Void) {
        var fsyms = ""
        if let models = dataStore.models {
            for model in models {
                fsyms += "\(model.name),"
            }
            service.fetchItems(fsyms: fsyms) { items in
                return completion(items)
            }
            
        } else {
            completion(nil)
        }
    }
}
