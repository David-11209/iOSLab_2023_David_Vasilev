//
//  CarTableViewCell.swift
//  CarShop
//
//  Created by Давид Васильев on 10.10.2023.
//

import UIKit

protocol CarCellDelegate: AnyObject {
    func didPressDetailDisclosure()
}

class CarTableViewCell: UITableViewCell {
    
    var carsInBasket: [Car] = []
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
        
    var car = Car(name: "", price: "", carImage: UIImage())
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    lazy var priceLabel : UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = .black
        priceLabel.font = priceLabel.font.withSize(12)
        return priceLabel
    }()
    
    private lazy var carImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var buyButton : UIButton = {
        let action = UIAction{ _ in
            self.carsInBasket.append(self.car)
               }
        let button = UIButton(configuration: .filled(), primaryAction: action)
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemGray4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        return button
    }()
    
    weak var delegate: CarCellDelegate?
    weak var controller: CarShopController?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(carImageView)
        contentView.addSubview(buyButton)
    }
    
    func configureCell(with car: Car){
        
        carImageView.image = car.carImage
        titleLabel.text = car.name
        priceLabel.text = car.price
        
        self.car = car
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            priceLabel.topAnchor.constraint(equalTo:titleLabel.bottomAnchor,constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            carImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            carImageView.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -30),
            carImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            carImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            
            buyButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            buyButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1),
            buyButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
        ])
    }
    
}
