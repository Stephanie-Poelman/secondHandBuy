//
//  Advertisement.swift
//  SecondHandBuy
//
//  Created by Stephanie on 18/02/16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import Foundation

class Advertisement: NSObject {
    
    var name: String
    var product: String
    var condition: String?
    var price: Double
    var dateCreated: NSDate
    var location: String
   
    
    init(name: String, product: String, condition: String?, price: Double, dateCreated: NSDate, location: String) {
        self.name = name
        self.product = product
        self.condition = condition
        self.price = price
        self.dateCreated = NSDate()
        self.location = location
    }
    
}




