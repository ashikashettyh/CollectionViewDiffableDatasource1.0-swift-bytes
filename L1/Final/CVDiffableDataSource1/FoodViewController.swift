//
//  FoodViewController.swift
//  CVDiffableDataSource1
//
//  Created by Ashika Shetty on 09/07/21.
//

import UIKit

private let reuseIdentifier = "myCellID"

class FoodViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    enum Section {
        case main
    }
    
    let food = ["Chicken biryani","egg biryani","chicken tandoori", "gobi manchurian", "chicken 65", "kane fry", "prawns ghee roast", "chicken ghee roast", "anjal masala", "kori rotti", "chicken sukka", "chicken hyderbad biryani", "chicken kebab", "fried rice", "bangda curry", "pomfret fry", "rice noodles with chicken curry"]
    var foodList = [Food]()
    
    lazy var dataSource: UICollectionViewDiffableDataSource<Section, Food> = makeDiffableDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeFoodList()
        applySnapshot()
    }
    
    private func makeFoodList() {
        for foodItem in food {
            foodList.append(Food(name: foodItem))
        }
    }
    
    func makeDiffableDataSource() -> UICollectionViewDiffableDataSource<Section, Food> {
        let datasource = UICollectionViewDiffableDataSource<Section, Food>(collectionView: collectionView) { collectionView, IndexPath, food in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellID", for: IndexPath) as? MyCell
            cell?.foodLabel.text = food.name
            return cell
        }
        return datasource
    }
    
    func applySnapshot() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Food>()
        snapShot.appendSections([.main])
        snapShot.appendItems(foodList)
        dataSource.apply(snapShot)
    }
}
