//
//  ShopView.swift
//  CarShop
//
//  Created by Давид Васильев on 18.10.2023.
//

import UIKit

class ShopView: UIView {
    
    lazy var button: UIBarButtonItem = UIBarButtonItem()
    lazy var table: UITableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        setUpButton()
        setUpTable()
    }
    
    private func setUpButton(){
        button.title = "Корзина"
    }
    private func setUpTable(){
        addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemGray4
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            table.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            table.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
