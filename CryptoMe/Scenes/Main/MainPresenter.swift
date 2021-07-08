//
//  MainPresenter.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import UIKit

protocol MainPresentationLogic {
    func presentItems(response: Main.ShowItems.Response)
}

class MainPresenter: MainPresentationLogic {
    weak var controller: MainDisplayLogic?
    
    func presentItems(response: Main.ShowItems.Response) {
        switch response.result {
        case let .failure(error):
            print(error)
            controller?.displayItems(viewModel: .init(state: .emptyResult(title: "", subtitle: "")))
        case let .success(items):
            let viewModel = items.map({MainViewModel(name: $0.key, usd: $0.value.usd.description, euro: $0.value.euro.description)})
            controller?.displayItems(viewModel: .init(state: .result(viewModel)))
        }
    }
}

struct MainViewModel {
    let name: String
    let usd: String
    let euro: String
}
