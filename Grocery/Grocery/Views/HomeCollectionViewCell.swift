//
//  HomeCollectionViewCell.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var addButton: UIButton!
    
    override func awakeFromNib() {
        self.round(true)
        
        addButton.round()
    }
    
    
    @IBAction func addButton(_ sender: UIButton) {
        
    }
    
}
