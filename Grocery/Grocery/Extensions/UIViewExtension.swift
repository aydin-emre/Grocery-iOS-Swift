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
    
}
