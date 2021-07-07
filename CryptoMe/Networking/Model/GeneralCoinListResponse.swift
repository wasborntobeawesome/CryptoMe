//
//  GeneralCoinListResponse.swift
//  CryptoMe
//
//  Created by Alimov Islom on 07/07/21.
//

import Foundation
struct GeneralCoinListResponse: Codable {
    let response: String
    let baseImageUrl: String
    let baseLinkUrl: String
    let type: Int?
    let hasWarning: Bool?
    let message: String
    var data: [String: GeneralCoinResponse]
}

extension GeneralCoinListResponse {
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case baseImageUrl = "BaseImageUrl"
        case baseLinkUrl = "BaseLinkUrl"
        case type = "type"
        case hasWarning = "hasWarning"
        case message = "Message"
        case data = "Data"
    }
}
