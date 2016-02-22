//
//  Advertisement.swift
//  SecondHandBuy
//
//  Created by Stephanie on 18/02/16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import Foundation
/*
class Advertisement: UITableViewController {
    
// MARK: Properties
    
    var product: String
    var name: String
    var picture: PFFile
    
    
    if random {

    
    
    var productArray = [String]()
    var nameArray = [String]()
    var pictureArray = [PFFile]()
    
    }
    
    
// MARK: Outlets
    @IBOutlet var AdvertisementTableView: UITableView!
    
    
// MARK: Functions
    
    // Retrieve objects from Parse
    
    func retrieveAdvertisement() {
        
        // Create a new Query
        let query = PFQuery(className: "ProductStore")
        
        // Call find Object in Background
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            
            // Clear productArray, nameArray and pictureArray
            self.productArray = [String]()
            self.nameArray = [String]()
            self.pictureArray = [PFFile]()
            
            // Loop through objectID's
            for productStoreObject in objects! {
                
                // Retrieve the value of product, name and picture of each objectID's
                let productName: String? = (productStoreObject as PFObject)["product"] as? String
                let nameName: String? = (productStoreObject as PFObject)["name"] as? String
                let picturePhoto: PFFile? = (productStoreObject as PFObject)["picture"] as? PFFile
                
                // add it to productArray, nameArray and pictureArray
                
                // productArray
                if productName != nil {
                    self.productArray.append(productName!)
                }
                
                // nameArray
                if nameName != nil {
                    self.nameArray.append(nameName!)
                }
                
                // pictureArray
                if picturePhoto != nil {
                    self.pictureArray.append(picturePhoto!)
                }
            }
            
            // reload Store Advertisement
            self.AdvertisementTableView.reloadData()
        }
    }
    
    
    
    
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add products from Parse
        self.retrieveAdvertisement()
        
    }
}


*/

