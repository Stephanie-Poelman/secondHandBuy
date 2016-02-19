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
import Parse

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!

    @IBOutlet var mapView: MKMapView!
    
    
// MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let amsterdam =
        MKCoordinateRegionMake(CLLocationCoordinate2DMake(52.3470959,
            4.8300982), MKCoordinateSpanMake(0.2, 0.2))
        
        mapView.setRegion(amsterdam, animated: true)
        
        mapView.delegate = self
        
        // 1
        let location = CLLocationCoordinate2D(latitude: 52.373305, longitude:
            4.892629)
        
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        var status = CLLocationManager.authorizationStatus()
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
//        
//        //User's location
//        let userGeopoint = userObject["LocationUser"] as PFGeoPoint
//        // Create a query for places
//        var query = PFQuery(className:"ProductStore")
        
        
        let point = PFGeoPoint(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        
     //   ProductStore["locationManager"] = point
        
        PFGeoPoint.geoPointForCurrentLocationInBackground {
            (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
            if error == nil {
                // do something with the new Geopoint
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation
        newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        let region = MKCoordinateRegionMakeWithDistance(
        newLocation.coordinate, 2000, 2000)
        mapView.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}



