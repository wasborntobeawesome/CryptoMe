//
//  MainBuilder.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import UIKit

class MainBuilder: ModuleBuilder {
    func build() -> UIViewController {
        let presenter = MainPresenter()
        let interactor = MainInteractor(presenter: presenter)
        let controller = MainController(interactor: interactor)
        presenter.controller = controller
        return UINavigationController(rootViewController: controller)
    }
    
    
}
