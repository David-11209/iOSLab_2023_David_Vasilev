//
//  CarShopModel.swift
//  CarShop
//
//  Created by Давид Васильев on 10.10.2023.
//

import Foundation
import UIKit

class CarShopModel{
    
    weak var controller: CarShopController?
    var cars: [Car] = []
    var carsInBusket: [Car] = []
    
    func getCars() {
        cars.append(Car(name: "Toyota", price: "$6000", carImage: UIImage(named:"Toyota") ?? UIImage()))
        cars.append(Car(name: "Ferrari", price: "$100000", carImage: UIImage(named:"Ferrari") ?? UIImage()))
        cars.append(Car(name: "Lada", price: "$4000", carImage: UIImage(named:"Lada") ?? UIImage()))
    }
    
}
