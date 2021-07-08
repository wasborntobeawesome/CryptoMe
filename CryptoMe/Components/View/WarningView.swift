//
//  WarningView.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import UIKit
import Lottie

class WarningView: UIView {
    let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .preferredFont(forTextStyle: .largeTitle)
        title.text = "OOPS..."
        title.textAlignment = .center
        return title
    }()
    
    let subTitleLabel: UILabel = {
        let title = UILabel()
        title.text = "You don't have any favorite crypto coin. Please add crypto coin to follow updates"
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = .preferredFont(forTextStyle: .title2)
        return title
    }()
    
    let animationView = AnimationView(name: "error")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(animationView)
        
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
    }
    func setupConstraints() {
        animationView.snp.makeConstraints { make in
            make.height.width.equalTo(150)
            make.centerY.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.top).offset(-40)
            make.leading.trailing.equalToSuperview().inset(60)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
        }
    }
}
