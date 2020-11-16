//
//  BaseViewController.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import UIKit
import EAAlert

public class BaseViewController: UIViewController {
    
    var alert: EAAlert!
    
    public func initialSetup() {
        self.view.backgroundColor = bgColor
        
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        alert = EAAlert()
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
