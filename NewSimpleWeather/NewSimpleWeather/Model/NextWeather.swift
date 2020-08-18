//
//  NextWeather.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 18/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class NextDaysWeather: NSObject {
    
    var nextDaysList: [NextWeather] = []
    
    func creatNextDaysList(from weather: Weather){
        let dailyList = weather.daily.data
        for day in dailyList {
            let newDay = NextWeather(from: day)
            self.nextDaysList.append(newDay)
        }
    
        self.nextDaysList.remove(at: 0)
    }
}

class NextWeather: NSObject {

    var icon: IconWeather = IconWeather.cloudy
    var day: String = ""
    var temperatureMin: String = ""
    var temperatureMax: String = ""
    
    init(from weather: DataWeather){
        super.init()
        
        self.icon = IconWeather.getIconType(weather.icon)
        self.day = getDayString(value: weather.time)
        self.temperatureMin = getTemperatureString(value: weather.apparentTemperatureMin)
        self.temperatureMax = getTemperatureString(value: weather.apparentTemperatureMax)
        
    }
    
    //Week day - Month day, year
    func getDayString(value: Int) -> String {
        let timeValue = TimeInterval(value)
        let date = Date(timeIntervalSince1970: timeValue)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormat().day
        
        
        let dayString = dateFormatter.string(from: date)
        return dayString
    }
    
    
    //The value is in celsius by default
    func getTemperatureString(value: Double) -> String{
        let temperaturePreference = Temperature.getPreference()
        var stringTemperature = ""
        
        switch temperaturePreference {
        case .celsius:
            let degrees = Int(value)
            stringTemperature = "\(degrees)\(Constants.Temperature().celsius)"
            break
        case .fahrenheit:
            let degrees = Int(Temperature.celsiusToFahrenheit(value))
            stringTemperature = "\(degrees)\(Constants.Temperature().fahrenheit)"
            break
        }
        
        return stringTemperature
    }
    
}
