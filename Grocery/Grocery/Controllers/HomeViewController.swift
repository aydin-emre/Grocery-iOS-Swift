//
//  HomeViewController.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import UIKit
import HiAnalytics

class HomeViewController: BaseViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        HiAnalytics.onEvent("screens", setParams: ["title" : self.title])
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = lightGrayColor
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = false // if you want to pin header view, set it true
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 16
            let width = (collectionView.frame.width)/2 - 8
            layout.itemSize = CGSize(width: width, height: width*5/4)
            layout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        }
        
        addGroceries()
    }
    
    func addGroceries() {
        DataManager.shared.groceries = [
            GroceryItem("item1", "6ft Pre-lit Artificial Christmas Tree Alberta Spruce Clear Lights - Wondershop", price: 36),
            GroceryItem("item2", "Manscaped Lawn Mower 2.0 + Crop Preserver Essentials kit", price: 39.99),
            GroceryItem("item3", "Canon Pixma MG3620 Wireless Inkjet All-In-One Printer - Black", price: 49.99),
            GroceryItem("item4", "JBL Tune 750 Bluetooth Over-Ear Headphones - Black", price: 99.99),
            GroceryItem("item5", "Apple Watch Series 6 GPS Aluminum", price: 379.99),
            GroceryItem("item6", "quip Plastic Electric Toothbrush", price: 18.75),
            GroceryItem("item7", "Barilla Spaghetti Pasta - 16oz", price: 1.29),
            GroceryItem("item8", "Frozen Mixed Vegetables - 12oz - Good & Gather™", price: 0.95),
            GroceryItem("item9", "Reese's Peanut Butter Cups - 1.5oz", price: 0.99),
            GroceryItem("item10", "Steam-in-Bag Spinach - 9oz - Good & Gather™", price: 1.99),
            GroceryItem("item11", "Grade A Large Eggs - 12ct - Good & Gather™", price: 1.99),
            GroceryItem("item12", "Girls' Printed Zip-Up Hoodie - Cat & Jack™", price: 8),
            GroceryItem("item13", "Toddler Boys' Fleece Bottom Pull-On Pants - Cat & Jack™", price: 5),
            GroceryItem("item14", "LG 43 inch Class 4K UHD Smart LED HDR TV - 43UN7000PUB", price: 249.99),
            GroceryItem("item15", "Apple AirPods with Charging Case", price: 129.99),
            GroceryItem("item16", "Powerbeats Pro True Wireless In-Ear Earphones", price: 159.99),
            GroceryItem("item17", "Grid Texture Bath Towel - Room Essentials™", price: 3),
            GroceryItem("item18", "Heathered Thermal Room Darkening Curtain Panel - Room Essentials™", price: 9),
            GroceryItem("item19", "Logitech Mouse - Black (M185)", price: 12.99),
            GroceryItem("item20", "Panasonic DECT 6.0 Plus Cordless Phone System (KX-TGC222S) with Answering Machine - Silver", price: 39.99)
        ]
        
        collectionView.reloadData()
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

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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

