//
//  WeatherViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 03/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, LocationDelegate {

    // MARK: - Attributes
    let location = Location()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location.delegate = self
        location.setupLocationManagerWithVC()
    }
    
    // MARK: - LocationDelegate
    func gotCurrentLocation(latitude: Double, longitude: Double) {
        print("\(latitude), \(longitude)")
    }
    
}
