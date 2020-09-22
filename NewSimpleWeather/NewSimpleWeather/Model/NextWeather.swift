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
    
    func updateTemperature() {
        for day in nextDaysList {
            day.updateTemperature()
        }
    }
}

class NextWeather: NSObject {

    var icon: IconWeather = IconWeather.cloudy
    var day: String = ""
    var temperatureMin: String = ""
    var temperatureMax: String = ""
    var rawValueTemperatureMin: Double = 0.0
    var rawValueTemperatureMax: Double = 0.0
    
    init(from weather: DataWeather){
        super.init()
        
        self.icon = IconWeather.getIconType(weather.icon)
        self.day = getDayString(value: weather.time)
        self.temperatureMin = getTemperatureString(value: weather.apparentTemperatureMin)
        self.temperatureMax = getTemperatureString(value: weather.apparentTemperatureMax)
        self.rawValueTemperatureMin = weather.temperatureMin
        self.rawValueTemperatureMax = weather.temperatureMax
    }
    
    //Week day - Month day, year
    private func getDayString(value: Int) -> String {
        let timeValue = TimeInterval(value)
        let date = Date(timeIntervalSince1970: timeValue)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormat().dayWithoutYear
        
        
        let dayString = dateFormatter.string(from: date)
        return dayString
    }
    
    
    //The value is in celsius by default
    private func getTemperatureString(value: Double) -> String{
        let temperaturePreference = Temperature.getPreference()
        var stringTemperature = ""
        
        switch temperaturePreference {
        case .celsius:
            let degrees = Int(value)
            stringTemperature = "\(degrees)"
            break
        case .fahrenheit:
            let degrees = Int(Temperature.celsiusToFahrenheit(value))
            stringTemperature = "\(degrees)"
            break
        }
        
        return stringTemperature
    }
    
    func updateTemperature(){
        self.temperatureMin = getTemperatureString(value: self.rawValueTemperatureMin)
        self.temperatureMax = getTemperatureString(value: self.rawValueTemperatureMax)
    }
}
