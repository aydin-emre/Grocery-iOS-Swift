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
import ScanKitFrameWork

class CartViewController: BaseViewController {
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var checkoutContainerView: UIView!
    
    @IBOutlet var totalPriceLabel: UILabel!
    
    @IBOutlet var checkoutButton: UIButton!
    
    var totalAmount = 0.0
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        reloadList()
    }
    
    @IBAction func checkoutButton(_ sender: UIButton) {
        scanQR()
    }
    
    func reloadList() {
        let isCartEmpty = DataManager.shared.cart.count == 0
        messageLabel.isHidden = !isCartEmpty
        checkoutContainerView.isHidden = isCartEmpty
        collectionView.isHidden = isCartEmpty
        collectionView.reloadData()
        
        totalAmount = DataManager.shared.cart.reduce(0) { $0 + $1.price }
        totalPriceLabel.text = "Total: \(String(format: "$%.2f", totalAmount))"
    }
    
    func removeFromCart(_ row: Int)  {
        let productId = DataManager.shared.cart[row].id!
        HiAnalytics.onEvent(kDelProductFromCart, setParams: [kProductId : productId])
        DataManager.shared.cart.remove(at: row)
        reloadList()
    }
    
    func scanQR() {
        let options = HmsScanOptions(scanFormatType: 0, photo: false)
        if let hmsDefaultScanViewController = HmsDefaultScanViewController(defaultScanWithFormatType: options) {
            hmsDefaultScanViewController.defaultScanDelegate = self
            
            self.view.addSubview(hmsDefaultScanViewController.view)
            self.addChild(hmsDefaultScanViewController)
            self.didMove(toParent: hmsDefaultScanViewController)
        }
    }
    
    func parseResult(_ dictionary: [AnyHashable : Any]?) {
        if let dictionary = dictionary, let text = dictionary["text"] {
            let resultText = text as! String
            
            DispatchQueue.main.async {
                let isPaymentSuccessful = resultText == "com.ea.Grocery"
                self.performSegue(withIdentifier: "seguePaymentResult", sender: isPaymentSuccessful)
                if isPaymentSuccessful {
                    DataManager.shared.cart.removeAll()
                }
            }
        } else {
            print("*** Scanning code not recognized!")
        }
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
        } else if segue.identifier == "seguePaymentResult" {
            let isPaymentSuccessful = sender as! Bool
            let eatc = segue.destination as! PaymentResultViewController
            eatc.isPaymentSuccessful = isPaymentSuccessful
            eatc.paymentAmount = totalAmount
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

// DefaultView Delegate
extension CartViewController: DefaultScanDelegate {
    
    func defaultScanImagePickerDelegate(for image: UIImage!) {
        let dic = HmsBitMap.bitMap(for: image, with: HmsScanOptions(scanFormatType: 0, photo: true))
        parseResult(dic)
    }
    
    func defaultScanDelegate(forDicResult resultDic: [AnyHashable : Any]!) {
        parseResult(resultDic)
    }
    
}
