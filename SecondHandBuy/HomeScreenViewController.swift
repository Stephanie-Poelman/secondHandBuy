//
//  HomeScreen.swift
//  SecondHandBuy
//
//  Created by Kithin Yeung on 15-02-16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import UIKit


class HomeScreenViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    
    
// MARK: Actions
    
        @IBAction func takePicture(sender: AnyObject) {
            
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture; otherwise,
        // just pick from photo library
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
        }
        else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
            imagePicker.delegate = self
            
            //Place image picker on the screen
            presentViewController(imagePicker, animated: true, completion: nil)
    }
    

        
    @IBAction func clickToMapScreen(sender: AnyObject) {
        
    }
    
    
    
}
