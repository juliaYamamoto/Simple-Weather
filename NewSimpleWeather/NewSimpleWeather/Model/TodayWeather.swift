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
    var countryName: String = ""
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
    var wind: String = ""
    
    var rawValueTemperature: Double = 0.0
    var rawValueApparentTemperature: Double = 0.0
    var rawValueTemperatureMin: Double = 0.0
    var rawValueTemperatureMax: Double = 0.0
    
    override init() {
       super.init()
    }
    
    init(from weather: Weather){
        super.init()
        
        self.cityName = getLocationCity(location: weather.timezone)
        self.countryName = getLocationCountry(location: weather.timezone)
        self.icon = IconWeather.getIconType(weather.currently.icon)
        self.humidity = getPercentageFrom(value: weather.currently.humidity)
        self.rain = getPercentageFrom(value: weather.currently.precipProbability)
        self.day = getDayString(value: weather.currently.time)
        self.rawValueTemperature = weather.currently.temperature
        self.rawValueApparentTemperature = weather.currently.apparentTemperature
        self.temperature = getTemperatureString(value: rawValueTemperature)
        self.apparentTemperature = getFeelsLikeTemperatureString(value: rawValueApparentTemperature)
        self.wind = getWindSpeedString(value: weather.currently.windSpeed)
        
        let todayData = weather.daily.data[0]
        self.rawValueTemperatureMin = todayData.apparentTemperatureMin
        self.rawValueTemperatureMax = todayData.apparentTemperatureMax
        self.temperatureMin = getTemperatureMinMaxString(value: rawValueTemperatureMin)
        self.temperatureMax = getTemperatureMinMaxString(value: rawValueTemperatureMax)
        self.sunriseTime = getTimeString(value: todayData.sunriseTime)
        self.sunsetTime = getTimeString(value: todayData.sunsetTime)
        self.moonPhase = MoonPhase.getMoonType(todayData.moonPhase)
    }
    
    func updateTemperature(){
        self.temperature = getTemperatureString(value: rawValueTemperature)
        self.apparentTemperature = getTemperatureString(value: rawValueApparentTemperature)
        self.temperatureMin = getTemperatureMinMaxString(value: rawValueTemperatureMin)
        self.temperatureMax = getTemperatureMinMaxString(value: rawValueTemperatureMax)
    }
    
    private func getLocationCity(location: String) -> String {
        guard let city = location.components(separatedBy: "/").last else {  return " " }
        if (city.contains("_")) {
            let cityFullName: String = city.components(separatedBy: "_").joined(separator: " ")
            return cityFullName
        }
        return city
    }
    
    private func getLocationCountry(location: String) -> String {
        guard let country = location.components(separatedBy: "/").first else {  return " " }
        if (country.contains("_")) {
            let countryFullName: String = country.components(separatedBy: "_").joined(separator: " ")
            return countryFullName
        }
        return country
    }
    
    private func getPercentageFrom(value: Double) -> String {
        var percentage = String(format: "%.0f", value * 100)
        percentage = "\(percentage)%"
        
        return percentage
    }
    
    private func getWindSpeedString(value: Double) -> String {
        let windSpeed = "\(Int(value)) km/h"
        return windSpeed
    }
    
    //Week day - Month day, year
    private func getDayString(value: Int) -> String {
        let timeValue = TimeInterval(value)
        let date = Date(timeIntervalSince1970: timeValue)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormat().day
        
        
        let dayString = dateFormatter.string(from: date)
        return dayString
    }
    
    private func getTimeString(value: Int) -> String {
        let timeValue = TimeInterval(value)
        let date = Date(timeIntervalSince1970: timeValue)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormat().hour
        
        let timeString = dateFormatter.string(from: date)
        return timeString
    }
    
    //The value is in celsius by default
    private func getTemperatureString(value: Double) -> String{
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
    
    //The value is in celsius by default
    private func getTemperatureMinMaxString(value: Double) -> String{
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
    
    private func getFeelsLikeTemperatureString(value: Double) -> String {
        let stringTemperature = "\(Constants.Temperature().feelsLike) \(getTemperatureString(value: value))"
        return stringTemperature
    }
}
