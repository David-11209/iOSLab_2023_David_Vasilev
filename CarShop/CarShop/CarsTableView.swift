//
//  CarsTableView.swift
//  CarShop
//
//  Created by Давид Васильев on 10.10.2023.
//

import UIKit

class CarsTableView: UIView, UITableViewDelegate{
        
    lazy var button: UIButton = {
        var button = UIButton()
        button.setTitle("Корзина", for: .normal)
        button.backgroundColor = .systemGray4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var table: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.backgroundColor = .systemGray4
        table.rowHeight = 100
        table.register( CarTableViewCell.self, forCellReuseIdentifier: CarTableViewCell.reuseIdentifier)
        return table
    }()
    
    weak var controller: CarShopController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTableView()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (controller?.dataSource?.itemIdentifier(for: indexPath)) != nil {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private func setUpTableView(){
        addSubview(table)
        addSubview(button)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            table.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 50),
            table.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            button.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            button.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
        ])
    }
}
