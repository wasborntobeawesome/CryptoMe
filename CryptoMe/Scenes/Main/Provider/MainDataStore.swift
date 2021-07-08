//
//  MainDataStore.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import Foundation
protocol StoresMainModels: class {
    func deleteItem(id: String) -> Bool
    var models: [GeneralCoinResponse]? { get set }
}

class MainDataStore: StoresMainModels {
    func deleteItem(id: String) -> Bool {
        if let models = models {
            for (index, model) in models.enumerated() {
                if model.name == id {
                    self.models?.remove(at: index)
                    return true
                }
            }
        }
        return false
    }
    
    static let shared = MainDataStore()
    var models: [GeneralCoinResponse]?
}
