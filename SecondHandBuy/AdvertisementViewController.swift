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









