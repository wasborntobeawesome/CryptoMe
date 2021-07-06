//
//  CoinListResponse.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import Foundation
struct CoinListResponse: Codable {
    let response: String
    let hasWarning: Bool
    let message: String
    let type: Double
    let data: [String: CoinResponse]
}

extension CoinListResponse {
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case hasWarning = "HasWarning"
        case message = "Message"
        case type = "Type"
        case data = "Data"
    }
}
