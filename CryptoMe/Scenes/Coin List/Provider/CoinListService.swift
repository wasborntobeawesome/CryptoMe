//
//  CoinListService.swift
//  CryptoMe
//
//  Created by Alimov Islom on 07/07/21.
//

import Foundation
import Moya

protocol FetchesCoinListItems {
    func fetchItems(completion: @escaping (GeneralCoinListResponse?) -> Void)
}

class CoinListService: FetchesCoinListItems {
    private let moya: MoyaProvider<GeneralEndpoint>
    init(moya: MoyaProvider<GeneralEndpoint> = MoyaProvider<GeneralEndpoint>()) {
        self.moya = moya
    }
    
    func fetchItems(completion: @escaping (GeneralCoinListResponse?) -> Void) {
        moya.request(.allCoins) { result in
            switch result {
            case let .success(response):
//                do {
//                    let test = try response.map(GeneralCoinListResponse.self)
//                   / print(test)
//                } catch let error {
//                    print(error)
//                }
                let model = try? response.map(GeneralCoinListResponse.self)
                completion(model)
            case .failure:
                completion(nil)
            }
        }
    }
}
