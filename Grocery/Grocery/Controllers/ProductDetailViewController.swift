//
//  ProductDetailViewController.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/18/20.
//

import UIKit
import HiAnalytics

class ProductDetailViewController: BaseViewController {
    
    var delegate: HomeCollectionViewCellDelegate?
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var addButton: UIButton!
    
    var product: GroceryItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
        HiAnalytics.onEvent("screens", setParams: ["title" : self.title!])
        // Do any additional setup after loading the view.
        
        addButton.round()
        
        HiAnalytics.onEvent(kViewProduct, setParams: [kProductId : product.id!])
        HiAnalytics.onEvent(kViewProduct, setParams: [kProductName : product.title!])
        
        imageView.image = UIImage(named: product.image)
        titleLabel.text = product.title
        priceLabel.text = String(format: "$%.2f", product.price)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func addButton(_ sender: UIButton) {
        DataManager.shared.cart.append(product)
        let productId = product.id!
        HiAnalytics.onEvent(kAddProduct2Cart, setParams: [kProductId : productId])
    }
    
}
