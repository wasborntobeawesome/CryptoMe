//
//  CoinResponse.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import Foundation

struct CoinResponse: Codable {
    let id: Int
    let symbol: String
    let dataAvailableFrom: Double
    let partnerSymbol: String
}

extension CoinResponse {
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case dataAvailableFrom = "data_available_from"
        case partnerSymbol = "partner_symbol"
    }
}
