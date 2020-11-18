//
//  HomeCollectionViewCell.swift
//  Grocery
//
//  Created by Emre AYDIN on 11/16/20.
//

import UIKit

protocol HomeCollectionViewCellDelegate {
    func addButtonTapped(_ cell: UICollectionViewCell)
}

class HomeCollectionViewCell: UICollectionViewCell {
    
    var delegate: HomeCollectionViewCellDelegate?
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var addButton: UIButton!
    
    override func awakeFromNib() {
        self.round(true)
        
        addButton.round()
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        delegate?.addButtonTapped(self)
    }
    
}
