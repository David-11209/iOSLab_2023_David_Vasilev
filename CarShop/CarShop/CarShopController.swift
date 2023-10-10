//
//  ViewController.swift
//  CarShop
//
//  Created by Давид Васильев on 10.10.2023.
//

import UIKit

class CarShopController: UIViewController, CarCellDelegate{
    func didPressDetailDisclosure() {
        print("123")
    }
    
    enum TableSection{
        case main
        case secondary
    }
    
    lazy var carsTableView: CarsTableView = CarsTableView(frame: .zero)
    lazy var basketView: BasketView = BasketView()
    
    var model = CarShopModel()
    var carsInBasket: [Car] = []
    var cars: [Car] = []
    var dataSource : UITableViewDiffableDataSource<TableSection,Car>?
    var basketDataSource : UITableViewDiffableDataSource<TableSection,Car>?
    
    @objc func toBasketAction() {
        loadSecondView()
    }
    
    @objc func toShopAction() {
        loadView()
    }
    
    lazy var add: (Car) -> Void = { [weak self] currentCar in
        self?.carsInBasket.append(currentCar)
    }
    
    func setupDataSource() {
        
        dataSource = UITableViewDiffableDataSource(tableView: carsTableView.table, cellProvider: { [self] tableView, indexPath, car in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.reuseIdentifier, for: indexPath) as! CarTableViewCell
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
    
    private func getCars() {
        model.getCars()
        cars = model.cars
        applySnapshot(cars: cars)
    }
    
    private func applySnapshot(cars: [Car]) {
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, Car>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(cars, toSection: .main)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: - loadViews
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        setupDataSource()
        getCars()
    }
    
    override func loadView() {
        view = carsTableView
    }
    
    func loadSecondView() {
        view = basketView
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carsTableView.button.addTarget(self, action: #selector(toBasketAction), for: .touchUpInside)
        basketView.button.addTarget(self, action: #selector(toShopAction), for: .touchUpInside)
    }
}

