//
//  CoinListBuilder.swift
//  CryptoMe
//
//  Created by Alimov Islom on 07/07/21.
//

import UIKit

protocol ModuleBuilder {
    func build() -> UIViewController
}

class CoinListBuilder: ModuleBuilder {
    func build() -> UIViewController {
        let presenter = CoinListPresenter()
        let interactor = CoinListInteractor(presenter: presenter)
        let controller = CoinListController(interactor: interactor)
        presenter.controller = controller
        return controller
    }
    
    
}
