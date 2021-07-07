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
            var text: String?
        }
        struct Response {
            var result: Result<[GeneralCoinResponse]>

            enum Error: Swift.Error {
                case fetchError
                case emptySearch
            }
        }

        struct ViewModel {
            var state: ControllerState
        }
    }
    
    enum SelectItems {
        struct Request {
            let key: String
        }
        struct Response {
            var values: [GeneralCoinResponse]
            var selectedValues: [GeneralCoinResponse]
        }
        struct ViewModel {
            var count: Int
            var values: [GeneralCoinResponse]
        }
        
    }

    enum ControllerState {
        case loading
        case result([CoinListViewModel])
        case search([CoinListViewModel])
        case emptyResult(title: String, subtitle: String)
        case error(message: String)
    }
}

// swiftlint:enable nesting
