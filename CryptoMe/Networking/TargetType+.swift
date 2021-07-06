//
//  TargetType+.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import Moya
import Foundation

extension TargetType {
    
    var baseURL: URL {
        guard let url =  URL(string: "https://min-api.cryptocompare.com/data/") else {
            fatalError("WRONG URL")
        }
        return url
    }
    
    var method: Moya.Method {
        .get
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json",
         "authorization": "Apikey 6f11e831ada33b24a15e663a0b55c370fb1fe0850cf18cf73a0e6a8390d8de46"]
    }
    
    func snakeCaseCodable(data: Codable) -> Task {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return Task.requestCustomJSONEncodable(data, encoder: encoder)
    }
}
