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
            navigationItem.title = info?.valueForKey("title") as? String
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
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Put objects in Parse into Outlets
        photoView.file = info?.valueForKey("picture") as? PFFile
        photoView.loadInBackground()
        //date
        productLabel.text = "  \(info?.valueForKey("product") as! String)"
        conditionLabel.text = "  \(info?.valueForKey("condition") as! String)"
        priceLabel.text = "  € \(info?.valueForKey("price") as! String)"
        sellerLabel.text = "  \(info?.valueForKey("name") as! String)"
        phoneNumberLabel.text = "  \(info?.valueForKey("phoneNumber") as! String)"
        eMailLabel.text = "  \(info?.valueForKey("eMail") as! String)"
        
        // Show N/A if there is no information in the label
        if conditionLabel.text == nil || conditionLabel.text == "" {
            conditionLabel.text = "N/A"
        }
        
        if phoneNumberLabel.text == nil || phoneNumberLabel.text == "" {
            phoneNumberLabel.text = "N/A"
        }
        
        if eMailLabel.text == nil || eMailLabel.text == "" {
            eMailLabel.text = "N/A"
        }
        
        // Make corners of labels round
        self.productLabel.layer.cornerRadius = 8
        self.productLabel.layer.masksToBounds = true
        self.conditionLabel.layer.cornerRadius = 8
        self.conditionLabel.layer.masksToBounds = true
        self.priceLabel.layer.cornerRadius = 8
        self.priceLabel.layer.masksToBounds = true
        self.sellerLabel.layer.cornerRadius = 8
        self.sellerLabel.layer.masksToBounds = true
        self.phoneNumberLabel.layer.cornerRadius = 8
        self.phoneNumberLabel.layer.masksToBounds = true
        self.eMailLabel.layer.cornerRadius = 8
        self.eMailLabel.layer.masksToBounds = true
        self.dateLabel.layer.cornerRadius = 8
        self.dateLabel.layer.masksToBounds = true
        
    }
}








