//
//  ShopDataManager.swift
//  CarShop
//
//  Created by Давид Васильев on 18.10.2023.
//

import Foundation
import UIKit
class ShopDataManager: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    static let shared = CartDataManager()
    var shopSample: ShopSample
//    private(set) var cachedCars: [Car] = []
    
    init(shopSample: ShopSample) {
        self.shopSample = shopSample
//        self.cachedCars = cachedCars
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopSample.carsData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = shopSample.carsData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopTableViewCell.reuseIdentifier, for: indexPath) as! ShopTableViewCell
        
        cell.configure(with: car)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
//    func addCar(_ car: Car) {
//        cachedCars.append(car)
//    }
//    
//    func removeCar(by id: String) {
//        cachedCars.removeAll(where: { $0.id == id })
//    }
}
