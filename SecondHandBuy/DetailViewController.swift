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
    var info: PFObject? {
        // Show title advertisement in navigationController
        didSet {
            navigationItem.title = info?.valueForKey("titleAdvertisement") as? String
        }
    }
    
    
// MARK: Outlets
    @IBOutlet var photoView: PFImageView!
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var sellerLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var eMailLabel: UILabel!

  
// MARK: Functions
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Put objects in Parse into Outlets
        photoView.file = info?.valueForKey("picture") as? PFFile
        photoView.loadInBackground()
        dateLabel.text = "  Since \(info?.valueForKey("date") as! String)"
        productLabel.text = "  \(info?.valueForKey("product") as! String)"
        conditionLabel.text = "  \(info?.valueForKey("condition") as! String)"
        priceLabel.text = "  € \(info?.valueForKey("price") as! String)"
        sellerLabel.text = "  \(info?.valueForKey("name") as! String)"
        phoneNumberLabel.text = "  \(info?.valueForKey("phoneNumber") as! String)"
        eMailLabel.text = "  \(info?.valueForKey("eMail") as! String)"
        
        // Show N/A if there is no information in the label
        if productLabel.text == nil || productLabel.text == "  " || conditionLabel.text == nil || conditionLabel == "  " || phoneNumberLabel == nil || phoneNumberLabel == "  " || eMailLabel.text == nil || eMailLabel.text == "  " {
            
            productLabel.text = "  N/A"
            conditionLabel.text = "  N/A"
            phoneNumberLabel.text = "  N/A"
            eMailLabel.text = "  N/A"
        }
        
        // Make corners of labels round and add borderlines
       
        // productLabel
//        self.productLabel.layer.cornerRadius = 8
//        self.productLabel.layer.masksToBounds = true
//        self.productLabel.layer.borderColor = UIColor.grayColor().CGColor
//        self.productLabel.layer.borderWidth = 0.5
        
        // conditionLabel
//        self.conditionLabel.layer.cornerRadius = 8
//        self.conditionLabel.layer.masksToBounds = true
//        self.conditionLabel.layer.borderColor = UIColor.grayColor().CGColor
//        self.conditionLabel.layer.borderWidth = 0.5
        
        // priceLabel
//        self.priceLabel.layer.cornerRadius = 8
//        self.priceLabel.layer.masksToBounds = true
//        self.priceLabel.layer.borderColor = UIColor.grayColor().CGColor
//        self.priceLabel.layer.borderWidth = 0.5
        
        // sellerLabel
//        self.sellerLabel.layer.cornerRadius = 8
//        self.sellerLabel.layer.masksToBounds = true
//        self.sellerLabel.layer.borderColor = UIColor.grayColor().CGColor
//        self.sellerLabel.layer.borderWidth = 0.5
        
        // phoneNumberLabel
//        self.phoneNumberLabel.layer.cornerRadius = 8
//        self.phoneNumberLabel.layer.masksToBounds = true
//        self.phoneNumberLabel.layer.borderColor = UIColor.grayColor().CGColor
//        self.phoneNumberLabel.layer.borderWidth = 0.5
        
        // eMailLabel
//        self.eMailLabel.layer.cornerRadius = 8
//        self.eMailLabel.layer.masksToBounds = true
//        self.eMailLabel.layer.borderColor = UIColor.grayColor().CGColor
//        self.eMailLabel.layer.borderWidth = 0.5
//        self.eMailLabel.backgroundColor = UIColor.clearColor()
        
        // dateLabel
//        self.dateLabel.layer.cornerRadius = 8
//        self.dateLabel.layer.masksToBounds = true
//        self.dateLabel.layer.borderColor = UIColor.grayColor().CGColor
//        self.dateLabel.layer.borderWidth = 0.5
        
        
        // Change color navigationbar button
        UIBarButtonItem.appearance().tintColor = UIColor.blackColor()

    }
    
}








