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
    case multipleSymbolPrice(fsyms: String, tsyms: String)
}

extension PriceEndpoint: TargetType {
    var path: String {
        switch self {
        case .singleSymbolPrice:
            return "price"
        case .multipleSymbolPrice:
            return "pricemulti"
        }
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .singleSymbolPrice(fsym, tsyms):
            return .requestParameters(parameters: ["fsym": fsym, "tsyms": tsyms],
                                      encoding: URLEncoding.queryString)
        case let .multipleSymbolPrice(fsyms, tsyms):
            return .requestParameters(parameters: ["fsyms": fsyms, "tsyms": tsyms],
                                      encoding: URLEncoding.queryString)
        }
    }
}
