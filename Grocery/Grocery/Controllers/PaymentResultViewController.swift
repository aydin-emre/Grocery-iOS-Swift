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

class PaymentResultViewController: BaseViewController {
    
    @IBOutlet var paymentResultLabel: UILabel!
    
    @IBOutlet var paymentAmountTitleLabel: UILabel!
    
    @IBOutlet var paymentAmountLabel: UILabel!
    
    var isPaymentSuccessful: Bool!
    var paymentAmount: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Payment Result"
        HiAnalytics.onEvent("screens", setParams: ["title" : self.title!])
        // Do any additional setup after loading the view.
        
        paymentResultLabel.text = isPaymentSuccessful ? "Payment Successful" : "Payment Unsuccessful"
        paymentResultLabel.textColor = isPaymentSuccessful ? .systemGreen : .systemRed
        paymentAmountLabel.text = String(format: "$%.2f", paymentAmount)
        
        paymentAmountTitleLabel.isHidden = !isPaymentSuccessful
        paymentAmountLabel.isHidden = !isPaymentSuccessful
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
