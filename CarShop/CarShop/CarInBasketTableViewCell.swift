//
//  CarInBasketTableViewCell.swift
//  CarShop
//
//  Created by Давид Васильев on 10.10.2023.
//

import UIKit

class CarInBasketTableViewCell: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .red
        return titleLabel
    }()
    
    lazy var priceLabel : UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = .red
        return priceLabel
    }()
    
    private lazy var carImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
//    weak var delegate: CarCellDelegate?
    
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
    }
    func configureCell(with car: Car){
        
        carImageView.image = car.carImage
        titleLabel.text = car.name
        priceLabel.text = car.price
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            priceLabel.topAnchor.constraint(equalTo:titleLabel.bottomAnchor,constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            carImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            carImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            carImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8)
        ])
    }
}
