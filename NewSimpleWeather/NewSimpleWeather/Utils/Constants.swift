//
//  Constants.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 25/07/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class Constants: NSObject {

    public struct API {
        let schemeURL: String = "https"
        let baseURL: String = "api.darksky.net"
        
        let forecastPath: String = "forecast"
        let keyValue: String = "8be6ee97dfdc80b35ee98a2ec52b938d"
        
        let queryNameExclude: String = "exclude"
        let queryValueCurrently: String = "currently"
        let queryValueMinutely: String = "minutely"
        let queryValueHourly: String = "hourly"
        let queryValueDaily: String = "daily"
        let queryValueAlerts: String = "alerts"
        let queryValueFlags: String = "flags"
        
        let queryNameUnits: String = "units"
        let queryValueUnitCA: String = "ca"
    }
    
    public struct Temperature {
        let preference: String = "TemperaturePreference"
        let feelsLike: String = "Feels like:"
        let celsius: String = "°C"
        let fahrenheit: String = "°F"
    }
    
    public struct DateFormat {
        let day: String = "EEEE - MMMM d, yyyy"
        let dayWithoutYear: String = "EEEE - MMMM d"
        let hour: String = "h:mm"
    }
    
    // MARK: - State Moon Icon
    
    public struct StateMoonImage {
           let firstQuarter: String = "FirstQuarter"
           let fullMoon: String = "FullMoon"
           let lastQuarter: String = "LastQuarter"
           let newMoon: String = "NewMoon"
    }
    
    
    // MARK: - State Weather Icon
    
    public struct StateIcon {
        let clearDay: String = "clear-day"
        let clearNight: String = "clear-night"
        let rain: String = "rain"
        let snow: String = "snow"
        let sleet: String = "sleet"
        let wind: String = "wind"
        let fog: String = "fog"
        let cloudy: String = "cloudy"
        let partlyCloudDay: String = "partly-cloudy-day"
        let partlyCloudNight: String = "partly-cloudy-night"
    }
    
    public struct StateIconImage {
           let clearDay: String = "ClearDay"
           let clearNight: String = "ClearNight"
           let rain: String = "Rain"
           let snow: String = "Snow"
           let sleet: String = "Sleet"
           let wind: String = "Wind"
           let fog: String = "Fog"
           let cloudy: String = "Cloudy"
           let partlyCloudyDay: String = "PartlyCloudyDay"
           let partlyCloudyNight: String = "PartlyCloudyNight"
    }
}
