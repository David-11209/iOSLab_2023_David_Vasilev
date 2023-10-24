//
//  CartViewController.swift
//  CarShop
//
//  Created by Давид Васильев on 18.10.2023.
//

import UIKit
protocol CartCellDelegate: AnyObject {
    func didPressDetailDisclosure()
}
class CartViewController: UIViewController, CartCellDelegate {
    
    func didPressDetailDisclosure() {
        print("123")
    }
    
    enum TableSection{
        case main
        case secondary
    }
    
    lazy var cartView: CartView = CartView(frame: .zero)

    var dataManager = CartDataManager()
    
    
    override func loadView() {
        view = cartView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        cartView.controller = self
        setupDataSource()

    }
    
    func didPressAddCar() {
        
        let car = Car(id: UUID().uuidString, name: "Toyota", price: "$20000", carImage: UIImage(named: "app-state")!)
        
        dataManager.addCar(car)
        
        let Controller = SecondViewController()
        secondController.users = dataManager.cachedUsers
        
        navigationController?.pushViewController(secondController, animated: true)
    }
    
//    @objc func toBasketAction() {
////        loadSecondView()
//    }
//    
//    @objc func toShopAction() {
//        loadView()
//    }
    

    func setupDataSource() {
        
        dataSource = UITableViewDataSource(tableView: table.table, cellProvider: { [self] tableView, indexPath, car in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.reuseIdentifier, for: indexPath) as! CartTableViewCell
            cell.configureCell(with: car)
            cell.delegate = self
            return cell
        })
        
        updateDataSource(with: cars, animate: false)
    }
    
    func updateDataSource(with cars: [Car], animate: Bool) {
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, Car>()
        snapshot.appendSections([.main, .secondary])
        snapshot.appendItems(cars)
        dataSource?.apply(snapshot, animatingDifferences: animate)
    }
    
    func updateBasketDataSource(with cars: [Car], animate: Bool) {
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, Car>()
        snapshot.appendSections([.main, .secondary])
        snapshot.appendItems(cars)
        basketDataSource?.apply(snapshot, animatingDifferences: animate)
    }
//    
//    private func getCars() {
//        model.getCars()
//        cars = model.cars
//        applySnapshot(cars: cars)
//    }
    
    private func applySnapshot(cars: [Car]) {
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, Car>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(cars, toSection: .main)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: - loadViews

    

    
//    func loadSecondView() {
//        view = basketView
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        table.button.addTarget(self, action: #selector(toBasketAction), for: .touchUpInside)
//        basketView.button.addTarget(self, action: #selector(toShopAction), for: .touchUpInside)
    }

}
