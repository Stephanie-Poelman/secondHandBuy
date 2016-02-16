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
    
        // To take picture
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
    
    // To show map
    @IBAction func clickToMapScreen(sender: AnyObject) {
        
    }
    
    // voorbeeld Code van stackoverflow om foto naar andere viewcontroller te verplaatsen:
    
    @IBAction func cameraButton(sender: AnyObject) {
        
        addNewPicture()
        
    }
    
    func addNewPicture() {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {

        postingImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func postButton(sender: AnyObject) {
        
        performSegueWithIdentifier("toBrowsePage", sender: nil)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toBrowsePage" {
            
            
            var itemToAdd = segue.destinationViewController as! ListPage
            
            itemToAdd.postingImage.image = browsingImage.image
            
        }
    }
}

