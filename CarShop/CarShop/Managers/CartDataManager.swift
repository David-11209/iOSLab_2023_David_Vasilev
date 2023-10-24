//
//  CartDataManager.swift
//  CarShop
//
//  Created by Давид Васильев on 18.10.2023.
//

import Foundation
class CartDataManager {
    
    static let shared = CartDataManager()
    
    private(set) var cachedCars: [Car] = []
    
    func addCar(_ car: Car) {
        cachedCars.append(car)
    }
    
    func removeCar(by id: String) {
        cachedCars.removeAll(where: { $0.id == id })
    }
    
    //    weak var controller: CarShopController?
    //    var cars: [Car] = []
    //    var carsInBusket: [Car] = []
    //
    //    func getCars() {
    //        cars.append(Car(name: "Toyota", price: "$6000", carImage: UIImage(named:"Toyota") ?? UIImage()))
    //        cars.append(Car(name: "Ferrari", price: "$100000", carImage: UIImage(named:"Ferrari") ?? UIImage()))
    //        cars.append(Car(name: "Lada", price: "$4000", carImage: UIImage(named:"Lada") ?? UIImage()))
    //    }
}
