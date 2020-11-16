//
//  GroceryItem.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import UIKit

class GroceryItem {
    
    var image: String!
    var title: String!
    var price: Double!
    
    init(_ image: String!, _ title: String!, price: Double!) {
        self.image = image
        self.title = title
        self.price = price
    }
    
}
