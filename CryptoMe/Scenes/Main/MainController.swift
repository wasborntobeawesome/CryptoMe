//
//  ViewController.swift
//  CryptoMe
//
//  Created by Alimov Islom on 05/07/21.
//

import UIKit
import Moya
import SnapKit
class MainViewModel {
    let provider = MoyaProvider<BlockchainDataEndpoint>(session: ReqresSession.shared)
    func connect() {
//        provider.request(.singleSymbolPrice(fsym: "BTC", tsyms: "USD,EUR")) { result in
//            print(result)
//        }
        
        provider.request(.coinList) { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(response):
                do {
              let model =  try response.map(CoinListResponse.self)
                    print(model)
                }
                catch let error {
                    print(error)
                }
            }
        }
    }
}
class MainController: UIViewController {
    let viewModel = MainViewModel()
    let connecButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Connect", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        view.backgroundColor = .systemRed
        view.addSubview(connecButton)
        
        connecButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }
        
        connecButton.addTarget(self, action: #selector(handleConnect), for: .touchUpInside)
    }

    @objc private func handleConnect() {
        print("Hello World")
        viewModel.connect()
    }

}

