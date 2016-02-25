//
//  ViewController.swift
//  SecondHandBuy
//
//  Created by Stephanie on 15/02/16.
//  Copyright © 2016 Kithin en Stephanie. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //Show current location user on map
    var locationManager: CLLocationManager!

    @IBOutlet var mapView: MKMapView!

    
// MARK: Functions
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        //Reuse the annotation if possible
        var annotationView:MKPinAnnotationView? =
        mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotation.isKindOfClass(MKUserLocation) {
            
            return nil
        }
            //Show Image with pin
            
            var customAnnotation = annotation as! CustomAnnotation
            
            let image = customAnnotation.object!["picture"] as! PFFile
            
            let leftIconView = PFImageView (frame: CGRectMake(0, 0, 53, 53))
            leftIconView.file = image
            annotationView?.leftCalloutAccessoryView = leftIconView
        
        leftIconView.loadInBackground()
        
        
        
//        //Reuse the annotation if possible
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        return annotationView
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    retrieveLocationAdvertisement()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView.delegate = self
        
        let amsterdam =
        MKCoordinateRegionMake(CLLocationCoordinate2DMake(52.3470959,
            4.8300982), MKCoordinateSpanMake(0.2, 0.2))
        
        mapView.setRegion(amsterdam, animated: true)
        
        mapView.delegate = self
        
        // Location pin (Dam square)
        let location = CLLocationCoordinate2D(latitude: 52.373305, longitude:
            4.892629)
        
        // Span of area that is showed on the map(region Amsterdam)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        if status == .NotDetermined || status == .Denied || status
            == .AuthorizedWhenInUse {
            // present an alert indicating location authorization required
            // and offer to take the user to Settings for the app via
            // UIApplication -openUrl: and UIApplicationOpenSettingsURLString
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        
        mapView.showsUserLocation = true
    
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation
        newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        let region = MKCoordinateRegionMakeWithDistance(
        newLocation.coordinate, 2000, 2000)
        mapView.setRegion(region, animated: true)
           
    }
    
    
    func retrieveLocationAdvertisement() {
        
        // Create a new Query
        let query = PFQuery(className: "ProductStore")
        
        // Call find Object in Background
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            
            
            // Loop through objectID's
            for productStoreObject in objects! {
            
            print(productStoreObject)
                
            //retrieve the value of the location object
            let currentLocation = productStoreObject["location"] as? PFGeoPoint
            let titleAdvertisement = productStoreObject["titleAdvertisement"] as? String
            
            let price = productStoreObject["price"] as? String
                

           // make constant of current location user
                if let currentLong = currentLocation?.longitude {
                if let currentlat = currentLocation?.latitude {
            
            let location = CLLocationCoordinate2D(latitude: currentlat, longitude: currentLong)
                
            let annotation = CustomAnnotation(currentObject: productStoreObject)
                    
                    
                annotation.title = titleAdvertisement
                annotation.coordinate = location
                annotation.subtitle = "€ \(price!)"
            
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                
            print(currentLocation)
                        
                    } }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}







