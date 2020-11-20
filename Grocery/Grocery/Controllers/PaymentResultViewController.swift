//
//  PaymentResultViewController.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/19/20.
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
