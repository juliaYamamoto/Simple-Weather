//
//  Temperature.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 17/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

enum TemperatureMeasure {
    case celsius
    case fahrenheit
}

class Temperature: NSObject {
    static func setPreference(_ value: TemperatureMeasure){
        //TODO
    }
    
    static func getPreference() -> TemperatureMeasure{
        //TODO
        return .celsius
    }
    
    static func celsiusToFahrenheit(_ value: Double) -> Double{
        return (value * 1.8) + 32
    }
    
    static func fahrenheitToCelsius(_ value: Double) -> Double{
        return (value - 32) / 1.8
    }
}
