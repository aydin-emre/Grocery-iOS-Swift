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

class ProductDetailViewController: BaseViewController {
    
    var delegate: HomeCollectionViewCellDelegate?
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var addButton: UIButton!
    
    var product: GroceryItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Product Detail"
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
