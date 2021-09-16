//
//  CollectionViewController.swift
//  CVDiffableDataSource1
//
//  Created by Ashika Shetty on 14/06/21.
//

import UIKit

private let reuseIdentifier = "myCellID"

class CollectionViewController: UICollectionViewController {
    
    let food = ["Chicken biryani","egg biryani","chicken tandoori", "gobi manchurian", "chicken 65", "kane fry", "prawns ghee roast", "chicken ghee roast", "anjal masala", "kori rotti", "chicken sukka", "chicken hyderbad biryani", "chicken kebab", "fried rice", "bangda curry", "pomfret fry", "rice noodles with chicken curry"]
    var foodList = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeFoodList()
    }
    
    private func makeFoodList() {
        for foodItem in food {
            foodList.append(Food(name: foodItem))
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return foodList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MyCell else {return UICollectionViewCell()}
        cell.foodLabel.text = foodList[indexPath.row].name
        return cell
    }
}
