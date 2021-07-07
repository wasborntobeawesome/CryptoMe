//
//  CoinListView.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import UIKit

class CoinListView: UIView {
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
}
