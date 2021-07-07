//
//  GeneralCoinResponse.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import Foundation
struct GeneralCoinResponse: Codable {
    let sortOrder: String
    let algorithm: String
    let sponsored: Bool
    let isUsedInNft: Int?
    let blockTime: Double?
    let url: String
    let platformType: String?
    let coinName: String
    let blockNumber: Int?
    let assetTokenStatus: String
    let netHashesPerSecond: Double?
    let name: String
    let fullName: String
    let symbol: String
    let proofType: String
    let mktCapPenalty: Double?
    let totalCoinsMined: Double?
    let id: String
    let description: String
    let blockReward: Double?
    let assetLaunchDate: String?
    let decimalPoints: Decimal?
    let contentCreatedOn: Double
    let maxSupply: Double?
    let isTrading: Bool?
    let isUsedInDefi: Int?
    let imageUrl: String?
    let smartContractAddress: String?
    let builtOn: String?
    var isSelected: Bool?
}

extension GeneralCoinResponse {
    enum CodingKeys: String, CodingKey {
        case sortOrder = "SortOrder"
        case algorithm = "Algorithm"
        case sponsored = "Sponsored"
        case isUsedInNft = "IsUsedInNft"
        case blockTime = "BlockTime"
        case url = "Url"
        case platformType = "PlatformType"
        case coinName = "CoinName"
        case blockNumber = "BlockNumber"
        case assetTokenStatus = "AssetTokenStatus"
        case netHashesPerSecond = "NetHashesPerSecond"
        case name = "Name"
        case fullName = "FullName"
        case symbol = "Symbol"
        case proofType = "ProofType"
        case mktCapPenalty = "MktCapPenalty"
        case totalCoinsMined = "TotalCoinsMined"
        case id = "Id"
        case description = "Description"
        case blockReward = "BlockReward"
        case assetLaunchDate = "AssetLaunchDate"
        case decimalPoints = "DecimalPoints"
        case contentCreatedOn = "ContentCreatedOn"
        case maxSupply = "MaxSupply"
        case isTrading = "isTrading"
        case isUsedInDefi = "IsUsedInDefi"
        case imageUrl = "ImageUrl"
        case smartContractAddress = "SmartContractAddress"
        case builtOn = "BuiltOn"
        case isSelected
    }
}
