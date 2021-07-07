//
//  CoinListDataFlow.swift
//  CryptoMe
//
//  Created by Alimov Islom on 07/07/21.
//

import Foundation
// swiftlint:disable nesting
enum CoinList {
    // MARK: Use cases
    enum ShowItems {
        struct Request {
        }
        struct Response {
            var result: Result<GeneralCoinListResponse>

            enum Error: Swift.Error {
                case fetchError
            }
        }

        struct ViewModel {
            var state: ControllerState
        }
    }

    enum ControllerState {
        case loading
        case result([CoinListViewModel])
        case emptyResult(title: String, subtitle: String)
        case error(message: String)
    }
}

// swiftlint:enable nesting
