//
//  ShopTableViewCell.swift
//  CarShop
//
//  Created by Давид Васильев on 18.10.2023.
//

import UIKit

class ShopTableViewCell: UITableViewCell {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    private lazy var nameLabel: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    private lazy var costLabel: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    private lazy var carImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var addButtonTapped: (()->Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
            setUpCellImageView()
            setUpNameLabel()
            setUpCostLabel()
            setUpAddButton()
        }
    
    func configure(with car : Car){
        carImageView.image = car.carImage
        costLabel.text = car.price
        nameLabel.text = car.name
    }
    
    private func setUpCellImageView(){
        contentView.addSubview(carImageView)
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            carImageView.widthAnchor.constraint(equalToConstant: 80),
            carImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setUpAddButton(){
        contentView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle( "+", for: .normal)
        addButton.layer.cornerRadius = 2
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.gray.cgColor
        
        
        NSLayoutConstraint.activate([
            addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addButton.widthAnchor.constraint(equalToConstant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let selectButtonAction = UIAction { [weak self] _ in
            self?.addButtonTapped!()
        }
        
        addButton.addAction(selectButtonAction, for: .touchUpInside)
    }
    
    private func setUpNameLabel(){
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            nameLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
        ])
    }
    
    private func setUpCostLabel(){
        contentView.addSubview(costLabel)
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.textColor = .gray
        costLabel.font = UIFont.systemFont(ofSize: 12)
        
        
        NSLayoutConstraint.activate([
            costLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            costLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 8),
        ])
    }
    
}
