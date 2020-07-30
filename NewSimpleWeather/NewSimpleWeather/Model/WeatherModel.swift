//
//  WeatherModel.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 29/07/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

struct CurrentlyWeather: Codable {
    let time: Int //1595996859
    let summary: String //"Clear"
    let icon: String //"clear-night"
    let precipProbability: Int //0.01
    let temperature: Double //56.61
    let apparentTemperature: Double //56.61
    let humidity: Double //0.93
    let windSpeed: Double //6.24
}

struct WeatherData: Codable {
    let time: Int //1595919600
    let icon: String? //"partly-cloudy-day"
    let summary: String? //"Partly cloudy throughout the day."
    let sunriseTime: Int? //1595941920
    let sunsetTime: Int? //1595992980
    let moonPhase: Double? //0.31
    let precipProbability: Double? //0.01
    let windSpeed: Double? //7.44
    let humidity: Double? //0.9
    let apparentTemperature: Double? //57.15

//    let precipIntensity: Double? //0.0006
//    let precipIntensityMax: Double? //0.0021
//    let precipIntensityMaxTime: Int? //1596002400
//    let precipType: String? //"rain"
//    let temperatureHigh: Double? //63.25
//    let temperatureHighTime: Int? //1595976900
//    let temperatureLow: Double? //53.94
//    let temperatureLowTime: Int? //1596030720
//    let apparentTemperatureHigh: Double? //62.75
//    let apparentTemperatureHighTime: Int? //1595976900
//    let apparentTemperatureLow: Double? //54.43
//    let apparentTemperatureLowTime: Int? //1596030720
//    let dewPoint: Double? //54.26
//    let pressure: Double? //1012.6
//    let windGust: Double? //15.34
//    let windGustTime: Int? //1595976780
//    let windBearing: Int? //245
//    let cloudCover: Double? //0.45
//    let uvIndex: Int? //8
//    let uvIndexTime: Int? //1595968680
//    let visibility: Double? //9.88
//    let ozone: Double? //293.5
//    let temperatureMin: Double? //53.14
//    let temperatureMinTime: Int? //1595944320
//    let temperatureMax: Double? //63.25
//    let temperatureMaxTime: Int? //1595976900
//    let apparentTemperatureMin: Double? //53.63
//    let apparentTemperatureMinTime: Int? //1595944320
//    let apparentTemperatureMax: Double? //62.75
//    let apparentTemperatureMaxTime: Int? //1595976900
}

//minutely, hourly, daily
struct TimeFrameWeather: Codable {
    let summary: String
    let icon: String
    let data: [WeatherData]
}

struct Weather: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: CurrentlyWeather
//    let minutely: TimeFrameWeather?
//    let hourly: TimeFrameWeather?
    let daily: TimeFrameWeather?
}
