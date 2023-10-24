//
//  ShopSample.swift
//  CarShop
//
//  Created by Давид Васильев on 24.10.2023.
//

import Foundation
import UIKit
class ShopSample{
    var carsData:[Car] = [
        Car(id: UUID().uuidString, name: "Toyota", price: "$6000", carImage: UIImage(named:"Toyota") ?? UIImage()),
        Car(id: UUID().uuidString,name: "Ferrari", price: "$100000", carImage: UIImage(named:"Ferrari") ?? UIImage()),
        Car(id: UUID().uuidString, name: "Lada", price: "$4000", carImage: UIImage(named:"Lada") ?? UIImage()),
    ]
}
    
