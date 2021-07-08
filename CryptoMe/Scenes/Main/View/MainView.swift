//
//  MainView.swift
//  CryptoMe
//
//  Created by Alimov Islom on 08/07/21.
//

import UIKit

class MainView: UIView {
    let warningView = WarningView()
    let refreshControl = UIRefreshControl()
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Add Coins", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.addSubview(refreshControl)
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
        addSubview(tableView)
        backgroundColor = .white
        
    }
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        showAddButton()
    }
    
    func showAddButton() {
        addButton.removeFromSuperview()
        addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(30)
        }
    }
    
    func showTableView() {
        warningView.removeFromSuperview()
        tableView.isHidden = false
        showAddButton()
    }
    
    func showEmptyState() {
        addSubview(warningView)
        tableView.isHidden = true
        warningView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        showAddButton()
    }
}
