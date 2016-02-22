//
//  StoreAdvertisement.swift
//  SecondHandBuy
//
//  Created by Stephanie on 18/02/16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//


import UIKit




class StoreAdvertisement: UITableViewController {
    
// MARK: Properties
    var productArray = [String]()
    var nameArray = [String]()
    var pictureArray = [PFFile]()
    var conditionArray = [String]()
    var priceArray = [String]()
    var photoArray = [UIImage]()
  
   
    //    pictureArray?.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
    //    if error == nil {

    
//    let photo = UIImage(data: imageData!)
//    self.photoArray.append(photo!) } })
    
    // Add it to pictureArray
    //                pictureName?.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
    //                    if error == nil {
    //
    //                    let photo = UIImage(data: imageData!)
    //                        self.pictureArray.append(photo!)
    //                    }
    //                })

    
    
// MARK: Outlets
    @IBOutlet var AdvertisementTableView: UITableView!
    
    
// MARK: Functions


// Retrieve objects from Parse
    
    func retrieveAdvertisement() {
        
        // Create a new Query
        let query = PFQuery(className: "ProductStore")
        
        // Call find Object in Background
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            
            // Clear productArray
            self.productArray = [String]()
            self.nameArray = [String]()
            self.pictureArray = [PFFile]()
            
            // Loop through objectID's
            for productStoreObject in objects! {
                
                // Retrieve the value of product of each objectID's
                let productName: String? = (productStoreObject as PFObject)["product"] as? String
                let nameName: String? = (productStoreObject as PFObject)["name"] as? String
                let pictureName: PFFile? = (productStoreObject as PFObject)["picture"] as? PFFile
                
                // Add it to productArray
                if productName != nil {
                    self.productArray.append(productName!)
                }
                
                // Add it to nameArray
                if nameName != nil {
                    self.nameArray.append(nameName!)
                }
                
                
                // Add it to pictureArray
//                pictureName?.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
//                    if error == nil {
//                        
//                    let photo = UIImage(data: imageData!)
//                        self.pictureArray.append(photo!)
//               po     }
//                })
                
                // Add it to pictureArray
                if pictureName != nil {
                    self.pictureArray.append(pictureName!)
                }
            }
            
            // reload Store Advertisement
            self.AdvertisementTableView.reloadData()
    }
}

    
// Turn those retrieve objects from Parse into rows, that can display on the TableView
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
        
    }
    
// Create a data source for the rows, so the rows know where to retrieve the data from and display it
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Create an instance of UITableViewCell, with default appereance
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "UITableViewCell")
        
        // Create an constant to save all the products
        let product = productArray[indexPath.row]
        let name = nameArray[indexPath.row]
        let picture = photoArray[indexPath.row]
        
        

        // Create a cell to put the description of product in it
        cell.textLabel?.text = product
        cell.detailTextLabel?.text = name
        cell.imageView?.image = picture
        
        return cell
    }

    
  
// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add products from Parse
      self.retrieveAdvertisement()
        
    }
}






