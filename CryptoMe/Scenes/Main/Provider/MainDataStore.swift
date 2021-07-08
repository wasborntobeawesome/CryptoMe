//
//  MainDataStore.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import Foundation
protocol StoresMainModels: class {
    var models: [GeneralCoinResponse]? { get set }
}

class MainDataStore: StoresMainModels {
    static let shared = MainDataStore()
    var models: [GeneralCoinResponse]?
}
