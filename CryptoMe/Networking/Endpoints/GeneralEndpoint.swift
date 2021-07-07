//
//  GeneralEndpoint.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import Moya
import Foundation
enum GeneralEndpoint {
    case allCoins
}

extension GeneralEndpoint: TargetType {
    var path: String {
        "all/coinlist"
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
}
