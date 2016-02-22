//
//  DetailViewController.swift
//  SecondHandBuy
//
//  Created by Kithin Yeung on 16-02-16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import UIKit
import Parse
import CoreLocation


class AdvertisementViewController: UIViewController,  UITextFieldDelegate, CLLocationManagerDelegate {
    
// MARK: Properties
    
    var image: UIImage?
    
//Show current location user on map
    
    var locationManager: CLLocationManager!
    
    
// MARK: Outlets and Actions
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var productField: UITextField!
    @IBOutlet var conditionField: UITextField!
    @IBOutlet var priceField: UITextField!
    
    // Dismiss keyboard
    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Save advertisement
    @IBAction func save(sender: AnyObject) {
        
    // Create a PFGeoPoint
    let point = PFGeoPoint(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        
//    advertisement["location"] = point
       
    // Save objects
    let advertisement = PFObject(className: "ProductStore")
        advertisement["name"] = nameField.text
        advertisement["product"] = productField.text
        advertisement["condition"] = conditionField.text
        advertisement["price"] = priceField.text
        advertisement["location"] = point
        
        // Convert picture from UIImage to PFImage
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.5)
        let parsePhoto = PFFile(data: imageData!)
        
        advertisement["picture"] = parsePhoto!
        
        advertisement.saveInBackgroundWithBlock { (successful, error) -> Void in
            if (successful) {
               print("Entry saved successfully")
                
                // Notify saving was successful
                
                // Design Alert
                let title = "Alert"
                let message = "Saving was successful. You will go back to Buy Second Hand."
                let okeText = "Ok"
                
                // Make Alert
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
                let okayButton = UIAlertAction(title: okeText, style: UIAlertActionStyle.Default, handler: {(okayButton) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)})
                
                alert.addAction(okayButton)
                
               self.presentViewController(alert, animated: true, completion: nil)
            }
                
            else {
                print("save was not successful")
                
                // Notify saving was not successful
                
                // Design Alert
                let title = "Alert"
                let message = "Saving was not successful."
                let okeText = "Ok"
                
                // Make Alert
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
                let okayButton = UIAlertAction(title: okeText, style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(okayButton)
                
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
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
        
        
//        //Get the user's current location
//        advertisement["location"] = PFGeoPoint(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
//        advertisement.saveInBackground()
//        
//        //Query contacts based on location 
//        let query = PFQuery(className: "ProductStore")
//        query.whereKey("location", nearGeoPoint: PFGeoPoint(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!))
//        query.findObjectsInBackgroundWithBlock(<#T##block: PFQueryArrayResultBlock?##PFQueryArrayResultBlock?##([PFObject]?, NSError?) -> Void#>)
        
        
        
//        
//        // Put location of user in GeoPoint
//         let location = PFGeoPoint(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
//        
//        
//        let userLocation = PFObject(className: "ProductStore")
//        
//         ProductStore["locationManager"] = location
        
    }

}


    









