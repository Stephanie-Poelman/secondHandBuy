//
//  DetailViewController.swift
//  SecondHandBuy
//
//  Created by Kithin Yeung on 16-02-16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import UIKit



class AdvertisementViewController: HomeScreenViewController {
    
// MARK: Outlets and Actions
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    // Dismiss keyboard
    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
// Functions
    
    // Show keyboard when clicking on textField
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Put picture in AdvertisementView
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
    
        // Get picked image from info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    
        // Put that image on the screen in imageView
        imageView.image = image
    
        // Take image picker off the screen, you must call this dismiss method
        dismissViewControllerAnimated(true, completion: nil)
    }
}









