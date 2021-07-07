//
//  CoinListView.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import UIKit

class CoinListView: UIView {
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    let tableVew: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(tableVew)
    }
    
    func setupConstraints() {
        tableVew.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func showAddButton(_ count: Int) {
        addButton.setTitle("Add \(count) New Coins", for: .normal)
        addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(30)
        }
    }
    
    func hideButton() {
        addButton.removeFromSuperview()
    }
}
