//
//  PriceEndpoint.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import Moya
import Foundation

enum PriceEndpoint {
    case singleSymbolPrice(fsym: String, tsyms: String)
}

extension PriceEndpoint: TargetType {
    var path: String {
        return "price"
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .singleSymbolPrice(let fsym, let tsyms):
            return .requestParameters(parameters: ["fsym": fsym, "tsyms": tsyms],
                                      encoding: URLEncoding.queryString)
        }
    }
}
