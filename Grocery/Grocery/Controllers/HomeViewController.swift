// Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import HiAnalytics

class HomeViewController: BaseViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        HiAnalytics.onEvent("screens", setParams: ["title" : self.title!])
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = bgColor
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
            GroceryItem(1, "item1", "6ft Pre-lit Artificial Christmas Tree Alberta Spruce Clear Lights - Wondershop", price: 36),
            GroceryItem(2, "item2", "Manscaped Lawn Mower 2.0 + Crop Preserver Essentials kit", price: 39.99),
            GroceryItem(3, "item3", "Canon Pixma MG3620 Wireless Inkjet All-In-One Printer - Black", price: 49.99),
            GroceryItem(4, "item4", "JBL Tune 750 Bluetooth Over-Ear Headphones - Black", price: 99.99),
            GroceryItem(5, "item5", "Apple Watch Series 6 GPS Aluminum", price: 379.99),
            GroceryItem(6, "item6", "quip Plastic Electric Toothbrush", price: 18.75),
            GroceryItem(7, "item7", "Barilla Spaghetti Pasta - 16oz", price: 1.29),
            GroceryItem(8, "item8", "Frozen Mixed Vegetables - 12oz - Good & Gather™", price: 0.95),
            GroceryItem(9, "item9", "Reese's Peanut Butter Cups - 1.5oz", price: 0.99),
            GroceryItem(10, "item10", "Steam-in-Bag Spinach - 9oz - Good & Gather™", price: 1.99),
            GroceryItem(11, "item11", "Grade A Large Eggs - 12ct - Good & Gather™", price: 1.99),
            GroceryItem(12, "item12", "Girls' Printed Zip-Up Hoodie - Cat & Jack™", price: 8),
            GroceryItem(13, "item13", "Toddler Boys' Fleece Bottom Pull-On Pants - Cat & Jack™", price: 5),
            GroceryItem(14, "item14", "LG 43 inch Class 4K UHD Smart LED HDR TV - 43UN7000PUB", price: 249.99),
            GroceryItem(15, "item15", "Apple AirPods with Charging Case", price: 129.99),
            GroceryItem(16, "item16", "Powerbeats Pro True Wireless In-Ear Earphones", price: 159.99),
            GroceryItem(17, "item17", "Grid Texture Bath Towel - Room Essentials™", price: 3),
            GroceryItem(18, "item18", "Heathered Thermal Room Darkening Curtain Panel - Room Essentials™", price: 9),
            GroceryItem(19, "item19", "Logitech Mouse - Black (M185)", price: 12.99),
            GroceryItem(20, "item20", "Panasonic DECT 6.0 Plus Cordless Phone System (KX-TGC222S) with Answering Machine - Silver", price: 39.99)
        ]
        DataManager.shared.groceries.shuffle()
        collectionView.reloadData()
    }
    
    func addToCart(_ row: Int)  {
        DataManager.shared.cart.append(DataManager.shared.groceries[row])
        let productId = DataManager.shared.groceries[row].id!
        HiAnalytics.onEvent(kAddProduct2Cart, setParams: [kProductId : productId])
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueProductDetail" {
            let row = sender as! Int
            let eatc = segue.destination as! ProductDetailViewController
            eatc.product = DataManager.shared.groceries[row]
        }
    }

}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.shared.groceries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.delegate = self
        
        let groceryItem = DataManager.shared.groceries[indexPath.row]
        cell.imageView.image = UIImage(named: groceryItem.image)
        cell.titleLabel.text = groceryItem.title
        cell.priceLabel.text = String(format: "$%.2f", groceryItem.price)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueProductDetail", sender: indexPath.row)
    }
    
}

// MARK: - HomeCollectionViewCellDelegate

extension HomeViewController: HomeCollectionViewCellDelegate {
    
    func addButtonTapped(_ cell: UICollectionViewCell) {
        if let indexPath = self.collectionView.indexPath(for: cell) {
            addToCart(indexPath.row)
        }
    }
    
}
