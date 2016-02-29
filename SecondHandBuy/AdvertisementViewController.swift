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
    
    
    // Creating the instance of "NSDateFormatter" to display it in the advertisement
    // Retrieve the data to show the current date
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle
        
        return formatter
    }()
    
    // Design how to present the current date
    var shortDate: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.stringFromDate(NSDate())
    }
    
    //
    
    // MARK: Outlets and Action
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var productField: UITextField!
    @IBOutlet var conditionField: UITextField!
    @IBOutlet var priceField: UITextField!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!
    @IBOutlet var EmailField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    // Dismiss keyboard
    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Save advertisement
    
    // Button to save objects to Parse
    @IBAction func save(sender: AnyObject) {
        
        // Save objects
        let advertisement = PFObject(className: "ProductStore")
        advertisement["titleAdvertisement"] = titleField.text
        advertisement["product"] = productField.text
        advertisement["condition"] = conditionField.text
        advertisement["price"] = priceField.text
        advertisement["name"] = nameField.text
        advertisement["phoneNumber"] = phoneNumberField.text
        advertisement["eMail"] = EmailField.text
        advertisement["date"] = dateLabel.text
        
        // Convert picture from UIImage to PFImage
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.5)
        let parsePhoto = PFFile(data: imageData!)
        // Save take photo
        advertisement["picture"] = parsePhoto!
        
        // Security measurement to make sure "point" has both coordinates(latitude, longitude)
        if  let lat = locationManager.location?.coordinate.latitude, let long = locationManager.location?.coordinate.longitude {
            
            // Create a PFGeoPoint
            let point = PFGeoPoint(latitude: lat, longitude: long)
            
            // Save location
            advertisement["location"] = point
            
        }
        // End if lat and let
        
        // Show message advertisement saved successfully or not
        advertisement.saveInBackgroundWithBlock { (successful, error) -> Void in
            if (successful) {
                print("Entry saved successfully")
                
//                // Notify saving was successful
//                
                // Design Alert
                let title = "Alert"
                let message = "Saving was successful"
//                let homeText = "Home"
//                let mapPageText = "Map"
//                let advertisementPage = "Advertisements"
//                
//                
//                // Make Alert
//                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
//                
//                // Action button for HomeScreen
//                let homeButton = UIAlertAction(title: homeText, style: UIAlertActionStyle.Default, handler: {(homeButton) -> Void in
//                    self.dismissViewControllerAnimated(true, completion: nil)})
//                
//                // Button for MapView
//                
//                // Call MapViewController
//                let mapView = self.storyboard?.instantiateViewControllerWithIdentifier("mapView") as! MapViewController
//                
//                // Action button
//                let mapButton = UIAlertAction(title: mapPageText, style: UIAlertActionStyle.Default, handler: {(mapButton) -> Void in
//                    self.presentViewController(mapView, animated: true, completion: nil)})
//                
//                // Button for StoreAdvertisement
//                
//                // Call StoreAdvertisementViewController
//                let storeAdvertisementView = self.storyboard?.instantiateViewControllerWithIdentifier("storeAdvertisementView") as! StoreAdvertisement
//                
//                // Action button
//                let storeAdvertisementButton = UIAlertAction(title: advertisementPage, style: UIAlertActionStyle.Default, handler: {(storeAdvertisementButton) -> Void in
//                    self.navigationController?.presentViewController(storeAdvertisementView, animated: true, completion: nil)})
//                
//                
//                // Add buttons
//                alert.addAction(homeButton)
//                alert.addAction(mapButton)
//                alert.addAction(storeAdvertisementButton)
//                
//                
//                self.presentViewController(alert, animated: true, completion: nil)
                
            }
                // End if successfully
                
            else {
                print("save was not successful")
                
                // Notify saving was not successful
                
                // Design Alert
                let title = "Alert"
                let message = "Saving was not successful"
                let okeText = "OK"
                
                // Make Alert
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
                let okayButton = UIAlertAction(title: okeText, style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(okayButton)
                
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            // End else
        }
    }
    //
    
    // Functions
    
    // Show keyboard when clicking on textField
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        // Put image from action "Take Picture" in imageView
        imageView.image = image!
        
        locationManager.startUpdatingLocation()
        
        
        // Provide the dateLabel the current date
        let currentDate = NSDate()
        dateLabel.text = dateFormatter.stringFromDate(currentDate)
    }
    // End viewDidLoad
    
}














