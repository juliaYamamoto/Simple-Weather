//
//  Location.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 03/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationDelegate {
    func gotCurrentLocation(latitude: Double, longitude: Double)
}

class Location: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Attributes
    let locationManager = CLLocationManager()
    var delegate:LocationDelegate?
    
    // MARK: -  Setup
    func setupLocationManagerWithVC() {
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
    }
   
    // MARK: - Methods
    func getCurrentLocation() {
        guard let location = locationManager.location else {return}
        delegate?.gotCurrentLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
    
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            getCurrentLocation()
        case .denied:
            print("denied")
            //TODO - Ask to point a city or redirect to settings and change permission
            break
        default:
            break
        }
    }
}
