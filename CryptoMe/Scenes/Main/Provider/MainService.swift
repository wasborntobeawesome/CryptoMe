//
//  MainService.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import Foundation
import Moya

protocol FetchesMainItems {
    func fetchItems(fsyms: String, completion: @escaping ([String: PriceResponse]?) -> Void)
}


class MainService: FetchesMainItems {
    private let moya: MoyaProvider<PriceEndpoint>
    init(moya: MoyaProvider<PriceEndpoint> =  MoyaProvider<PriceEndpoint>(session: ReqresSession.shared)) {
        self.moya = moya
    }
    
    func fetchItems(fsyms: String, completion: @escaping ([String: PriceResponse]?) -> Void) {
        moya.request(.multipleSymbolPrice(fsyms: fsyms, tsyms: "USD,EUR")) { result in
            switch result {
            case let .success(response):
                let model = try? response.map([String: PriceResponse].self)
                completion(model)
                
            case .failure:
                completion(nil)
            }
        }
    }
}
