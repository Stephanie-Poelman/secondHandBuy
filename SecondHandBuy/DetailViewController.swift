//
//  DetailViewController.swift
//  SecondHandBuy
//
//  Created by Kithin Yeung on 21-02-16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
// MARK: Properties
    var detail: StoreAdvertisement!
    
// MARK: Outlets
  
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var sellerLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
// MARK: Functions
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        productLabel.text = detail.productArray

        
            }
    
}
