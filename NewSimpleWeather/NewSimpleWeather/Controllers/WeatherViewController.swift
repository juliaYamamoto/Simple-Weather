//
//  WeatherViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 03/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - Attributes
    
    let locationManager = CLLocationManager()
    var currentPosition: (latitude: Double, longitude: Double) = (0.0, 0.0)

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Location().setupLocationManager(locationManager: locationManager, weatherVC: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let location = Location().getCurrentLocation(locationManager) {
            currentPosition = location
        }
       
    }
    
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch CLLocationManager.authorizationStatus() {
        case .denied:
            print("denied")
            //TODO - Ask to point a city or redirect to settings and change permission
            break
        default:
            break
        }
    }
}
