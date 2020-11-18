//
//  CartViewController.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import UIKit
import HiAnalytics

class CartViewController: BaseViewController {
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var checkoutContainerView: UIView!
    
    @IBOutlet var totalPriceLabel: UILabel!
    
    @IBOutlet var checkoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
        HiAnalytics.onEvent("screens", setParams: ["title" : self.title!])
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = bgColor
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
        
        checkoutButton.round()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        reloadList()
    }
    
    @IBAction func checkoutButton(_ sender: UIButton) {
        
    }
    
    func reloadList() {
        let isCartEmpty = DataManager.shared.cart.count == 0
        messageLabel.isHidden = !isCartEmpty
        checkoutContainerView.isHidden = isCartEmpty
        collectionView.isHidden = isCartEmpty
        collectionView.reloadData()
        
        let sumOfPrices = DataManager.shared.cart.reduce(0) { $0 + $1.price }
        totalPriceLabel.text = "Total: \(String(format: "$%.2f", sumOfPrices))"
    }
    
    func removeFromCart(_ row: Int)  {
        let productId = DataManager.shared.cart[row].id!
        HiAnalytics.onEvent(kDelProductFromCart, setParams: [kProductId : productId])
        DataManager.shared.cart.remove(at: row)
        reloadList()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueProductDetail" {
            let row = sender as! Int
            let eatc = segue.destination as! ProductDetailViewController
            eatc.product = DataManager.shared.cart[row]
        }
    }

}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension CartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.shared.cart.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCollectionViewCell", for: indexPath) as! CartCollectionViewCell
        cell.delegate = self
        
        let groceryItem = DataManager.shared.cart[indexPath.row]
        cell.imageView.image = UIImage(named: groceryItem.image)
        cell.titleLabel.text = groceryItem.title
        cell.priceLabel.text = String(format: "$%.2f", groceryItem.price)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueProductDetail", sender: indexPath.row)
    }
    
}

// MARK: - CartCollectionViewCellDelegate

extension CartViewController: CartCollectionViewCellDelegate {
    
    func removeButtonTapped(_ cell: UICollectionViewCell) {
        if let indexPath = self.collectionView.indexPath(for: cell) {
            removeFromCart(indexPath.row)
        }
    }
    
}
