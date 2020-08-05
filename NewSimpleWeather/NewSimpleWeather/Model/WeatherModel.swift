//
//  WeatherModel.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 29/07/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

struct DataWeather: Codable {
    let time: Int
    let summary: String
    let icon: String
    let sunriseTime: Int
    let sunsetTime: Int
    let moonPhase: Double
    let precipProbability: Double
    let humidity: Double
    let windSpeed: Double
    let temperatureMin: Double
    let temperatureMax: Double
    let apparentTemperatureMin: Double
    let apparentTemperatureMax: Double
    
}

struct DayWeather: Codable {
    let summary: String
    let icon: String
    let data: [DataWeather]
}

struct CurrentWeather: Codable {
    let time: Int
    let summary: String
    let icon: String
    let precipProbability: Double
    let temperature: Double
    let apparentTemperature: Double
    let humidity: Double
    let windSpeed: Double
}

struct Weather: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: CurrentWeather
    let daily: DayWeather
}
