//
//  CoinListPresenter.swift
//  CryptoMe
//
//  Created by Alimov Islom on 07/07/21.
//

import UIKit

protocol CoinListPresentationLogic {
    func presentItems(response: CoinList.ShowItems.Response)
    func selectItems(reponse: CoinList.SelectItems.Response)
}

class CoinListPresenter: CoinListPresentationLogic {
    weak var controller: CoinListDisplayLogic?
    
    func presentItems(response: CoinList.ShowItems.Response) {
        var viewModel: CoinList.ShowItems.ViewModel
        switch response.result {
        case .failure:
            viewModel = CoinList.ShowItems.ViewModel(state: .error(message: "errorMessage"))
        case let .success(result):
            let model = result.map({CoinListViewModel(title: $0.fullName, subTitle: $0.name, isSelected: $0.isSelected ?? false)})
            viewModel = CoinList.ShowItems.ViewModel(state: .result(model))
        }
        controller?.displayItems(viewModel: viewModel)
    }
    
    func selectItems(reponse: CoinList.SelectItems.Response) {
        let viewModels = reponse.values.map({CoinListViewModel(title: $0.fullName, subTitle: $0.name, isSelected: $0.isSelected ?? false)})
        controller?.displayItems(viewModel: .init(state: .result(viewModels)))
        if reponse.selectedValues.isEmpty {
            controller?.hideButton(viewModel: .init(count: 0, values: []))
        } else {
            controller?.showButton(viewModel: .init(count: reponse.selectedValues.count, values: reponse.selectedValues))
        }
    }
}
