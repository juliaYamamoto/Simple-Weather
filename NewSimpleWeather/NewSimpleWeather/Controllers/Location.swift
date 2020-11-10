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
    func permissionDenied()
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
            getCurrentLocation()
        }
        
        else if CLLocationManager.authorizationStatus() == .denied{
            permissionDenied()
        }
    }
   
    // MARK: - Methods
    func getCurrentLocation() {
        if let location = locationManager.location {
            delegate?.gotCurrentLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        } else {
            permissionDenied()
        }
        
    }
    
    func permissionDenied() {
        delegate?.permissionDenied()
    }
    
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            getCurrentLocation()
        case .denied:
            permissionDenied()
            break
        default:
            break
        }
    }
}
