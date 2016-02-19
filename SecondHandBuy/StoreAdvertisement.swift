//
//  StoreAdvertisement.swift
//  SecondHandBuy
//
//  Created by Stephanie on 18/02/16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//


import UIKit




class StoreAdvertisement: UITableViewController {
    
    
    var productArray = [String]()
    
    
    // Retrieve objects
    
    func retrieveObjects() {
        
        // Create a new Query
        var query = PFQuery(className: "ProductStore")
        
        // Call find Object in Background
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            
            // Clear the productArray
            self.productArray = [String]()
            
            // Loop through the Objects Array
            for productStoreObjects in objects {
                
                // Retrieve the product column value of each PFObject
                let productStoreProduct: String? = (productStoreObjects as! PFObject)["product"] as? String
                
                // Add it into productArray
                if productStoreProduct != nil {
                    self.productArray.append(productStoreProduct!)
                }
                
            }
            
            // Reload store Advertisement
            self.
            
            
        }
    }
    

    
    
    
  /*
    var itemStore: ItemStore!
    var imageStore: ImageStore!
    
    //MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    //MARK: - Actions
    
    @IBAction func addNewItem(sender: AnyObject) {
        // Create a new Item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        if let index = itemStore.allItems.indexOf(newItem) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
            // Insert this new row into the table.
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
}
*/

}