//
//  ShopViewController.swift
//  CarShop
//
//  Created by Давид Васильев on 18.10.2023.
//

import UIKit

class ShopViewController: UIViewController {


    private var shopView: ShopView!
    private var shopSample: ShopSample!
    private var dataManager: ShopDataManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        shopSample = ShopSample()
        dataManager = ShopDataManager(shopSample: shopSample)
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar(){
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Корзина"
        
//        let busketBarItemAction = UIAction() { [weak self] _ in
//            self?.navigationController?.pushViewController(CartViewController(cars: shopSample.carsData), animated: true)
//        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "BusketIcon"), primaryAction: busketBarItemAction, menu: nil) // КАРТИНКА!!!!
    }
    
    
//    func didPressAddCar() {
//        
//        let car = Car(id: UUID().uuidString, name: "Toyota", price: "$20000", carImage: UIImage(named: "app-state")!)
//        
//        dataManager.addCar(car)
//        
//        let Controller = SecondViewController()
//        secondController.users = dataManager.cachedUsers
//        
//        navigationController?.pushViewController(secondController, animated: true)
//    }
    
    private func setUpView() {
        view = shopView
        navigationItem.rightBarButtonItem = shopView.button
    }
    
 
}
