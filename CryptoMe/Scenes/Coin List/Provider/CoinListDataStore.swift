//
//  CoinListDataStore.swift
//  CryptoMe
//
//  Created by Alimov Islom on 07/07/21.
//

import Foundation

protocol StoresCoinListModels: class {
    var model: GeneralCoinListResponse? { get set }
}

class CoinListDataStore: StoresCoinListModels {
    static let shared = CoinListDataStore()
    var model: GeneralCoinListResponse?
}
