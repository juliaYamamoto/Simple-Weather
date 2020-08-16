//
//  IconWeather.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 07/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

enum IconWeather {
    case clearDay
    case clearNight
    case rain
    case snow
    case sleet
    case wind
    case fog
    case cloudy
    case partlyCloudyDay
    case partlyCloudyNight
    
    static func getIconType(_ value: String) -> IconWeather {
        if (value == "clear-day") { return IconWeather.clearDay }
        else if (value == "clear-night") { return IconWeather.clearNight }
        else if (value == "rain") { return IconWeather.rain }
        else if (value == "snow") { return IconWeather.snow }
        else if (value == "sleet") { return IconWeather.sleet }
        else if (value == "wind") { return IconWeather.wind }
        else if (value == "fog") { return IconWeather.fog }
        else if (value == "cloudy") { return IconWeather.cloudy }
        else if (value == "partly-cloudy-day") { return IconWeather.partlyCloudyDay }
        else if (value == "partly-cloudy-night") { return IconWeather.partlyCloudyNight }
        
        return IconWeather.cloudy //Default
    }
}
