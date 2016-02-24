//
//  CustomCell.swift
//  SecondHandBuy
//
//  Created by Kithin Yeung on 22-02-16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

 // MARK: Outlets
    
    
    @IBOutlet var photoView: PFImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
   
    
    
// MARK: Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
