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
//import Parse

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //Show current location user on map
    var locationManager: CLLocationManager!

    @IBOutlet var mapView: MKMapView!
    
// MARK: Functions
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation) {
            
            return nil
        }
        
        //Reuse the annotation if possible
        var annotationView:MKPinAnnotationView? =
    mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(named: "pradas-second hand.jpg")
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        return annotationView
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let annotation = MKPointAnnotation()
        annotation.title = "Prada shoes"
        annotation.coordinate = location
        
        mapView.showAnnotations([annotation], animated: true)
        mapView.selectAnnotation(annotation, animated: true)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation
        newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        let region = MKCoordinateRegionMakeWithDistance(
        newLocation.coordinate, 2000, 2000)
        mapView.setRegion(region, animated: true)
            
        print(locationManager)
    }


        //Save coordinates 'Dam square' in geopoint
        
        //    let point = PFGeoPoint(latitude:52.373305, longitude:4.892629)
        
        
//        //Get the user's current location
//        
//        PFGeoPoint.geoPointForCurrentLocationInBackground {
//            (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
//            if error == nil {
//                //do something with the new geoPoint
//            }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    //function to determine location of user
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        var userLocation: CLLocation = locations[0] as! CLLocation
//        let long =

}



// Save location user in PFGeoPoint

////        //User's location
//       let userGeopoint = userObject["LocationUser"] as PFGeoPoint
////        // Create a query for places
//       var query = PFQuery(className:"AddAdvertisement")
//
//        let point = PFGeoPoint(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
//
//     //   AddAdvertisement["locationManager"] = point
//
//        PFGeoPoint.geoPointForCurrentLocationInBackground {
//            (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
//            if error == nil {
//                // do something with the new Geopoint
//            }
//              }
//




