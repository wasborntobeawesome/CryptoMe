//
//  PriceResponse.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import Foundation

struct PriceResponse: Codable {
    let euro: Double
    let usd: Double
    enum CodingKeys: String, CodingKey {
        case euro = "EUR"
        case usd = "USD"
    }
}
