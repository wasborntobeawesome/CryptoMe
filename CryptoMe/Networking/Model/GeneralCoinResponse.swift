//
//  GeneralCoinResponse.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import Foundation
struct GeneralCoinResponse: Codable {
    let SortOrder: String
    let Algorithm: String
    let Sponsored: Bool
    let IsUsedInNft: Int?
    let BlockTime: Double?
    let Url: String
    let PlatformType: String?
    let CoinName: String
    let BlockNumber: Int?
    let AssetTokenStatus: String
    let NetHashesPerSecond: Double?
    let Name: String
    let FullName: String
    let Symbol: String
    let ProofType: String
    let MktCapPenalty: Double?
    let TotalCoinsMined: Double?
    let Id: String
    let Description: String
    let BlockReward: Double?
    let AssetLaunchDate: String?
    let DecimalPoints: Decimal?
    let ContentCreatedOn: Double
    let MaxSupply: Double?
    let IsTrading: Bool
    let IsUsedInDefi: Int?
    let ImageUrl: String?
    let SmartContractAddress: String?
    let BuiltOn: String?
}

struct GeneralCoinListResponse: Codable {
    let Response: String
    let BaseImageUrl: String
    let BaseLinkUrl: String
//    let Type: Int
    let HasWarning: Bool
    let Message: String
    let Data: [String: GeneralCoinResponse?]
}
