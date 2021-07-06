//
//  BlockchainDataEndpoint.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import Moya
import Foundation

enum BlockchainDataEndpoint {
    case coinList
}

extension BlockchainDataEndpoint: TargetType {
    var path: String {
        return "blockchain/list"
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        .requestPlain
    }
    
    
}
