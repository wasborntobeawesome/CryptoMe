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
    let provider = MoyaProvider<GeneralEndpoint>(session: ReqresSession.shared)
    func connect() {
//        provider.request(.singleSymbolPrice(fsym: "BTC", tsyms: "USD,EUR")) { result in
//            print(result)
//        }
        
        provider.request(.allCoins) { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(response):
                do {
              let model =  try response.map(GeneralCoinListResponse.self)
                    print(model)
                }
                catch let error {
                    print(error)
                }
            }
        }
    }
}

import Lottie

class MainController: UIViewController {
    let animationView = AnimationView(name: "error")
    let titleLabel = UILabel()
    let subTitle = UILabel()
    let viewModel = MainViewModel()
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Coins", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    override func loadView() {
        super.loadView()
        title = "CryptoMe"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(animationView)
        view.addSubview(titleLabel)
        view.addSubview(subTitle)
        view.addSubview(addButton)
        
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.text = "OOPS..."
        titleLabel.textAlignment = .center
        
        subTitle.text = "You don't have any favorite crypto coin. Please add crypto coin to follow updates"
        subTitle.numberOfLines = 0
        subTitle.textAlignment = .center
        subTitle.font = .preferredFont(forTextStyle: .title2)
        
        animationView.snp.makeConstraints { make in
            make.height.width.equalTo(150)
            make.centerY.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
           // make.left.right.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.top).offset(-40)
            make.leading.trailing.equalToSuperview().inset(60)
        }
        
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        addButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(30)
        }
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
        
        
        
        addButton.addTarget(self, action: #selector(handleConnect), for: .touchUpInside)
    }

    @objc private func handleConnect() {
        print("Hello World")
//        viewModel.connect()
        let controller = CoinListBuilder().build()
        navigationController?.pushViewController(controller, animated: true)
    }

}

