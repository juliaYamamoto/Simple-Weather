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
//    let day: String
//    let sunriseTime: String
//    let sunsetTime: String
//    let temperature: String
//    let temperatureMin: String
//    let temperatureMax: String
//    let apparentTemperature: String
    
    init(from weather: Weather){
        super.init()
        self.cityName = getLocationCity(location: weather.timezone)
        self.contryName = getLocationCountry(location: weather.timezone)
        self.icon = IconWeather.getIconType(weather.currently.icon)
        self.humidity = getPercentageFrom(value: weather.currently.humidity)
        self.rain = getPercentageFrom(value: weather.currently.precipProbability)
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
        var percentage = "0%"
        if let intValue = Int(exactly: (value*100)) {
            percentage = "\(intValue)%"
        }
        
        return percentage
    }
    
}
