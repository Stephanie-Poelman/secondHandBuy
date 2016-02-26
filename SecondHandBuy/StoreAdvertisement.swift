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
    
    var infoArray = [PFObject]()
    
    
    // MARK: Outlets
    @IBOutlet var AdvertisementTableView: UITableView!
    
    
    // MARK: Functions
    
    
    // Retrieve objects from Parse
    
    func retrieveAdvertisement() {
        
        // Create a new Query
        let query = PFQuery(className: "ProductStore")
        
        // Call find Objects in Background
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            
            // Add objects in infoArray
            self.infoArray = objects!
            
            // Reload Store Advertisement
            self.AdvertisementTableView.reloadData()
        }
    }
    
    // Turn those retrieve objects from Parse into rows, that can display on the TableView
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    // Create a data source for the rows, so the rows know where to retrieve the data from and display it
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Make connection with CustomCell
        let cell = self.tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as! CustomCell
        
        // Add info of product, price and picture to cell in row
        let data = infoArray[indexPath.row]
        
        cell.titleLabel.text = data["titleAdvertisement"] as? String
        cell.priceLabel.text = "€ \(data["price"] as! String)"
        cell.photoView.file = data["picture"] as? PFFile
        cell.photoView.loadInBackground()
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailView = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        
        let indexPath = self.tableView.indexPathForSelectedRow?.row
        let info = infoArray[indexPath!]
        
        detailView.info = info
        
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add products from Parse
        self.retrieveAdvertisement()
        
        // Method for no space between cells
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
}






