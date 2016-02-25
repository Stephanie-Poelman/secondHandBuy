//
//  CustomAnnotation.swift
//  SecondHandBuy
//
//  Created by Stephanie on 25/02/16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import Foundation
import MapKit

class CustomAnnotation : MKPointAnnotation {
    
    var object: PFObject?
    
    init(currentObject: PFObject) {
        super.init()
        object = currentObject
    }
}
