//
//  CartView.swift
//  CarShop
//
//  Created by Давид Васильев on 18.10.2023.
//

import UIKit

class CartView: UIView {

    lazy var tableView: UITableView = UITableView()
       
       lazy var sumTitleLabel: UILabel = UILabel()
       
       lazy var sumLabel: UILabel = UILabel()

           
       override init(frame: CGRect) {
           super.init(frame: frame)
           backgroundColor = .white
           setUp()
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func setUp(){
           setUpTableView()
           setUpSumTitleLable()
           setUpSumLable()
       }
       
    private func setUpTableView(){
           addSubview(tableView)
           tableView.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
               tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
               tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
               tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
           ])
       }
       
       private func setUpSumTitleLable(){
           addSubview(sumTitleLabel)
           sumTitleLabel.translatesAutoresizingMaskIntoConstraints = false
           sumTitleLabel.text = "Итого"
           sumTitleLabel.font = UIFont.systemFont(ofSize: 23)
           
           NSLayoutConstraint.activate([
               sumTitleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
               sumTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
           ])

       }
    
    private func setUpSumLable(){
        addSubview(sumLabel)
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        var sum: Int = 0
        for item in CartSample.cart {
            sum += Int(item.price.replacingOccurrences(of: "$", with: ""))!
        }
        sumLabel.text = "$\(String(sum))"
        sumLabel.font = UIFont.systemFont(ofSize: 23)
        
        NSLayoutConstraint.activate([
            sumLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            sumLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 80),
        ])
        
    }

//    lazy var button: UIButton = {
//        var button = UIButton()
//        button.setTitle("Магазин", for: .normal)
//        button.backgroundColor = .systemGray4
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    lazy var table: UITableView = {
//        var table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.backgroundColor = .systemGray4
//        table.rowHeight = 100
//        table.register( CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.reuseIdentifier)
//        return table
//    }()
//    
//    weak var controller: CartViewController?
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUpTableView()
//        backgroundColor = .white
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc
//    func didPressAddButton() {
//        controller?.didPressAddUser()
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        if (controller?.dataSource?.itemIdentifier(for: indexPath)) != nil {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    
//    private func setUpTableView(){
//        addSubview(table)
//        addSubview(button)
//        NSLayoutConstraint.activate([
//            table.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
//            table.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            table.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
//            table.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            
//            button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            
//            button.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
//            button.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
//        ])
//    }
}
