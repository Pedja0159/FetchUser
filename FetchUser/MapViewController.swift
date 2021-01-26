//
//  MapViewController.swift
//  FetchUser
//
//  Created by Predrag on 06/12/2020.
//  Copyright © 2020 pejo015. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Contacts


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    
    var locationManager = CLLocationManager()
    var user: UserElement?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupMapView()
        
        
        
    }
    
    
    
    
    func setupMapView() {
        
        let mapView = MKMapView()
        
        let leftMargin:CGFloat = 0
        let topMargin:CGFloat = 0
        let mapWidth:CGFloat = view.frame.size.width
        let mapHeight:CGFloat = view.frame.size.height
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsUserLocation = true
        
        
        
        let coordinate = CLLocationCoordinate2D(latitude: 44.773190, longitude: 19.635820)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 44.773190, longitude: 19.635820)
        pin.title = "Majur City"
        pin.subtitle = "Hell Yea"
        mapView.addAnnotation(pin)
        view.addSubview(mapView)
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
}
private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}



