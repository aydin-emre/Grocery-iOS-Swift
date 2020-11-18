//
//  GroceryItem.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import UIKit

class GroceryItem {
    
    var id: Int!
    var image: String!
    var title: String!
    var price: Double!
    
    init(_ id: Int, _ image: String!, _ title: String!, price: Double!) {
        self.id = id
        self.image = image
        self.title = title
        self.price = price
    }
    
}
