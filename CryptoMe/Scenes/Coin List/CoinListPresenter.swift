//
//  CoinListPresenter.swift
//  CryptoMe
//
//  Created by Alimov Islom on 07/07/21.
//

import UIKit

protocol CoinListPresentationLogic {
    func presentItems(response: CoinList.ShowItems.Response)
}

class CoinListPresenter: CoinListPresentationLogic {
    
    weak var controller: CoinListDisplayLogic?
    
    func presentItems(response: CoinList.ShowItems.Response) {
        var viewModel: CoinList.ShowItems.ViewModel
        switch response.result {
        case .failure:
            viewModel = CoinList.ShowItems.ViewModel(state: .error(message: "errorMessage"))
        case let .success(result):
            viewModel = CoinList.ShowItems.ViewModel(state: .result(result))
        }
        controller?.displayItems(viewModel: viewModel)
    }
}
