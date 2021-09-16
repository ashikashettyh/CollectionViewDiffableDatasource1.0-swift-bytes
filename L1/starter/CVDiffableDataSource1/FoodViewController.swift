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
    
    let food = ["Chicken biryani","egg biryani","chicken tandoori", "gobi manchurian", "chicken 65", "kane fry", "prawns ghee roast", "chicken ghee roast", "anjal masala", "kori rotti", "chicken sukka", "chicken hyderbad biryani", "chicken kebab", "fried rice", "bangda curry", "pomfret fry", "rice noodles with chicken curry"]
    var foodList = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeFoodList()
        collectionView.dataSource = self
    }
    
    private func makeFoodList() {
        for foodItem in food {
            foodList.append(Food(name: foodItem))
        }
    }
}

extension FoodViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MyCell else {return UICollectionViewCell()}
        cell.foodLabel.text = foodList[indexPath.row].name
        return cell
    }
}
