//
//  Temperature.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 17/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

enum TemperatureMeasure: Int {
    case celsius = 0
    case fahrenheit = 1
}

class Temperature: NSObject {
    static func setPreference(_ value: TemperatureMeasure){
        UserDefaults().set(value.rawValue, forKey: Constants.Temperature().preference)
    }
    
    static func getPreference() -> TemperatureMeasure{
        if let preference = TemperatureMeasure(rawValue: UserDefaults().integer(forKey: Constants.Temperature().preference)) {
            return preference
        }
        return .celsius
    }
    
    static func celsiusToFahrenheit(_ value: Double) -> Double{
        return (value * 1.8) + 32
    }
    
    static func fahrenheitToCelsius(_ value: Double) -> Double{
        return (value - 32) / 1.8
    }
}
