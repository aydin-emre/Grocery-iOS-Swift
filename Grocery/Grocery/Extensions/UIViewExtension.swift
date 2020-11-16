//
//  UIViewExtension.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import Foundation
import UIKit

extension UIView {
    
    func round(_ masksToBounds: Bool = false) {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = masksToBounds
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 8
    }
    
    
}
