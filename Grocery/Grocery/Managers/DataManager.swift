//
//  DataManager.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import Foundation

class DataManager: NSObject {
    
    static var shared: DataManager = DataManager()
    
    var groceries = [GroceryItem]()
    var cart = [GroceryItem]()
    
}
