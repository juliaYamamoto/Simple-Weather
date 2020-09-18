//
//  IconWeather.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 07/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

enum IconWeather: String {
    case clearDay           = "Clear Day"
    case clearNight         = "Clear Night"
    case rain               = "Rain"
    case snow               = "Snow"
    case sleet              = "Sleet"
    case wind               = "Wind"
    case fog                = "Fog"
    case cloudy             = "Cloudy"
    case partlyCloudyDay    = "Partly Cloudy day"
    case partlyCloudyNight  = "Partly Cloudy night"
    
    static func getIconType(_ value: String) -> IconWeather {
        if (value == Constants.StateIcon().clearDay) { return IconWeather.clearDay }
        else if (value == Constants.StateIcon().clearNight) { return IconWeather.clearNight }
        else if (value == Constants.StateIcon().rain) { return IconWeather.rain }
        else if (value == Constants.StateIcon().snow) { return IconWeather.snow }
        else if (value == Constants.StateIcon().sleet) { return IconWeather.sleet }
        else if (value == Constants.StateIcon().wind) { return IconWeather.wind }
        else if (value == Constants.StateIcon().fog) { return IconWeather.fog }
        else if (value == Constants.StateIcon().cloudy) { return IconWeather.cloudy }
        else if (value == Constants.StateIcon().partlyCloudDay) { return IconWeather.partlyCloudyDay }
        else if (value == Constants.StateIcon().partlyCloudNight) { return IconWeather.partlyCloudyNight }
        
        return IconWeather.cloudy //Default
    }
    
    static func getStateIconImage(_ icon: IconWeather) -> String {
        switch icon {
        case .clearDay:
            return Constants.StateIconImage().clearDay
        case .clearNight:
            return Constants.StateIconImage().clearNight
        case .rain:
            return Constants.StateIconImage().rain
        case .snow:
            return Constants.StateIconImage().snow
        case .sleet:
            return Constants.StateIconImage().sleet
        case .wind:
            return Constants.StateIconImage().wind
        case .fog:
            return Constants.StateIconImage().fog
        case .cloudy:
            return Constants.StateIconImage().cloudy
        case .partlyCloudyDay:
            return Constants.StateIconImage().partlyCloudyDay
        case .partlyCloudyNight:
            return Constants.StateIconImage().partlyCloudyNight
        }
    }
}
