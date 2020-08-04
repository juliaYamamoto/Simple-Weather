//
//  Location.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 03/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit
import CoreLocation

class Location: NSObject {

    // MARK: -  Setup
    func setupLocationManager(locationManager: CLLocationManager, weatherVC: WeatherViewController) {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = weatherVC.self
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
    }
   
    // MARK: - Methods

    func getCurrentLocation(_ locationManager: CLLocationManager) -> (latitude: Double, longitude: Double)? {
        guard let location = locationManager.location else {return nil}
        return (location.coordinate.latitude, location.coordinate.longitude)
    }
    
}
