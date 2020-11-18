//
//  CartCollectionViewCell.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/17/20.
//

import UIKit

protocol CartCollectionViewCellDelegate {
    func removeButtonTapped(_ cell: UICollectionViewCell)
}

class CartCollectionViewCell: UICollectionViewCell {
    
    var delegate: CartCollectionViewCellDelegate?
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var removeButton: UIButton!
    
    override func awakeFromNib() {
        self.round(true)
        
        removeButton.round()
    }
    
    @IBAction func removeButton(_ sender: UIButton) {
        delegate?.removeButtonTapped(self)
    }
    
}
