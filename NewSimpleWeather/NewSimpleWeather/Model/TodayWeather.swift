//
//  TodayWeather.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 15/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class TodayWeather: NSObject {

    var cityName: String = ""
    var contryName: String = ""
    var icon: IconWeather = IconWeather.cloudy
    var humidity: String = ""
    var rain: String = ""
    var day: String = ""
    var temperature: String = ""
    var apparentTemperature: String = ""
    var temperatureMin: String = ""
    var temperatureMax: String = ""
    var sunriseTime: String = ""
    var sunsetTime: String = ""
    var moonPhase: MoonPhase = .newMoon
    
    init(from weather: Weather){
        super.init()
        
        self.cityName = getLocationCity(location: weather.timezone)
        self.contryName = getLocationCountry(location: weather.timezone)
        self.icon = IconWeather.getIconType(weather.currently.icon)
        self.humidity = getPercentageFrom(value: weather.currently.humidity)
        self.rain = getPercentageFrom(value: weather.currently.precipProbability)
        self.day = getDayString(value: weather.currently.time)
        self.temperature = getTemperatureString(value: weather.currently.temperature)
        self.apparentTemperature = getTemperatureString(value: weather.currently.apparentTemperature)
        
        let todayData = weather.daily.data[0]
        self.temperatureMin = getTemperatureString(value: todayData.apparentTemperatureMin)
        self.temperatureMax = getTemperatureString(value: todayData.apparentTemperatureMax)
        self.sunriseTime = getTimeString(value: todayData.sunriseTime)
        self.sunsetTime = getTimeString(value: todayData.sunsetTime)
        self.moonPhase = MoonPhase.getMoonType(todayData.moonPhase)
        
    }
    
    func getLocationCity(location: String) -> String{
        guard let city = location.components(separatedBy: "/").last else {  return " " }
        if (city.contains("_")) {
            let cityFullName: String = city.components(separatedBy: "_").joined(separator: " ")
            return cityFullName
        }
        return city
    }
    
    func getLocationCountry(location: String) -> String{
        guard let country = location.components(separatedBy: "/").first else {  return " " }
        if (country.contains("_")) {
            let countryFullName: String = country.components(separatedBy: "_").joined(separator: " ")
            return countryFullName
        }
        return country
    }
    
    func getPercentageFrom(value: Double) -> String{
        var percentage = String(format: "%.0f", value*100)
        percentage = "\(percentage)%"
        
        return percentage
    }
    
    //Week day - Month day, year
    func getDayString(value: Int) -> String {
        let timeValue = TimeInterval(value)
        let date = Date(timeIntervalSince1970: timeValue)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE - MMMM d, yyyy"
        
        
        let dayString = dateFormatter.string(from: date)
        return dayString
    }
    
    func getTimeString(value: Int) -> String {
        let timeValue = TimeInterval(value)
        let date = Date(timeIntervalSince1970: timeValue)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm"
        
        let timeString = dateFormatter.string(from: date)
        return timeString
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
