//
//  HomeScreen.swift
//  SecondHandBuy
//
//  Created by Kithin Yeung on 15-02-16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import UIKit


class HomeScreenViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {


// MARK: Actions
    
    // Show advertisement
    @IBAction func showAdvertisement(sender: AnyObject) {
    }
    
    
    // Take picture
    @IBAction func takePicture(sender: AnyObject) {
    
        
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture; otherwise, just pick from photo library
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
            
        } else {
            
        imagePicker.sourceType = .PhotoLibrary
            
        }
            
        imagePicker.delegate = self
            
        //Place image picker on the screen
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    // Show map
    @IBAction func showMap(sender: AnyObject) {
    }
    

// MARK: Functions
    
    
        // Select taken picture
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            
            // Get picked picture from info dictionary
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
            // Dismiss imagePickerController
            dismissViewControllerAnimated(true, completion: nil)
            
            // Call destination viewController
            let destinationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AdvertisementViewController") as! AdvertisementViewController
            
            // Put image in imageView of destinationViewController
            destinationViewController.image = image
            
            // Show destinationViewController
            self.presentViewController(destinationViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    let testObject = PFObject(className: "TestObject")
    testObject["foo"] = "bar"
    testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
    print("Object has been saved.")
    }
    }
    
    
}
    
   
    
    
    
    
    
    
    
    
    
    
    