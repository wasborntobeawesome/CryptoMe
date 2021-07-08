//
//  MainDataFlow.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import Foundation
// swiftlint:disable nesting
enum Main {
    // MARK: Use cases
    enum ShowItems {
        struct Request {
            var text: String?
        }
        struct Response {
            var result: Result<[String: PriceResponse]>

            enum Error: Swift.Error {
                case fetchError
                case emptyState
            }
        }

        struct ViewModel {
            var state: ControllerState
        }
    }
    
    enum ControllerState {
        case loading
        case result([MainViewModel])
        case emptyResult(title: String, subtitle: String)
        case error(message: String)
    }
}

// swiftlint:enable nesting
