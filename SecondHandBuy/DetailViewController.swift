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
    
    var info: PFObject?
    
    
// MARK: Outlets
  
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var sellerLabel: UILabel!
    @IBOutlet var imageView: PFImageView!
    
    
// MARK: Functions
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Put objects in Parse into Outlets
        
        productLabel.text = info?.valueForKey("product") as? String
        conditionLabel.text = info?.valueForKey("condition") as? String
        priceLabel.text = info?.valueForKey("price") as? String
        sellerLabel.text = info?.valueForKey("name") as? String
        imageView.file = info?.valueForKey("picture") as? PFFile
        imageView.loadInBackground()
        
    }

    
    
        

}








