//
//  DetailViewController.swift
//  SecondHandBuy
//
//  Created by Kithin Yeung on 16-02-16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import UIKit

class AdvertisementViewController: UIViewController,  UITextFieldDelegate {
    
// MARK: Properties
    
    var image: UIImage?
    
// MARK: Outlets and Actions
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    // Dismiss keyboard
    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Save advertisement
    @IBAction func save(sender: AnyObject) {
        
            // Create a new Item and add it to the store
    let newAdvertisement = Advertisement.createItem()
        
            // Figure out where that item is in the array
    if let index = itemStore.allItems.indexOf(newItem) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
                
                // Insert this new row into the table.
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        }
        
    }
    
    func sendToDatabase(item: Advertisement) {
        let advertisementObjects = PFObject(className: "ProductStore")
        advertisementObjects.setObject(item.name, forKey: "Name")
        advertisementObjects.setObject(item.product, forKey: "product")
        advertisementObjects.setObject(item.condition!, forKey: "condition")
        advertisementObjects.setObject(item.price, forKey: "price")
        advertisementObjects.setObject(item.dateCreated, forKey: "dateCreated")
        advertisementObjects.setObject(item.location, forKey: "location")
        advertisementObjects.saveInBackgroundWithBlock { (succeeded, error) -> Void in
            if succeeded {
                print ("Object Uploaded")
            } else {
                print ("Error: \(error) \(error!.userInfo)")
            }
        }
        
        sendToDatabase(Advertisement)
    }
    
    
    
// Functions
    
    // Show keyboard when clicking on textField
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Put image from action "Take Picture" in imageView
        imageView.image = image
    }
}










