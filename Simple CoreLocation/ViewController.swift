//
//  ViewController.swift
//  Simple CoreLocation
//
//  Created by 김종현 on 2019/11/04.
//  Copyright © 2019 김종현. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // CLLocationManagerDelegate 객체와 UIViewController 객체의 연결
        locationManager.delegate = self
        
        let pin = MKPointAnnotation();
        pin.coordinate.latitude = 35.164873
        pin.coordinate.longitude = 129.071415
        pin.title = "동의과학대학교"
        pin.subtitle = "우리들의 꿈이 자라는 곳"
        mapView.showAnnotations([pin], animated: true)
        
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
    }
    
    // CLLocationManager Delegate Method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        print(userLocation)
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
        mapView.setRegion(region, animated: true)

    }

}

