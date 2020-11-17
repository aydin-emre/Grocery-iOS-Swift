//
//  CartViewController.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import UIKit
import HiAnalytics

class CartViewController: BaseViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
        HiAnalytics.onEvent("screens", setParams: ["title" : self.title])
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = lightGrayColor
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = false // if you want to pin header view, set it true
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 16
            let width = (collectionView.frame.width)
            layout.itemSize = CGSize(width: width, height: 90)
            layout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension CartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.shared.groceries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
//        cell.delegate = self
        
        let groceryItem = DataManager.shared.groceries[indexPath.row]
        cell.imageView.image = UIImage(named: groceryItem.image)
        cell.titleLabel.text = groceryItem.title
        cell.priceLabel.text = String(format: "$%.2f", groceryItem.price)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
