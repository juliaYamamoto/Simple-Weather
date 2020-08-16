//
//  APIRequest.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 29/07/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class APIRequest: NSObject {
    
    
    static func getCompletePathWith(_ latitude: Double, _ longitude: Double) -> String {
        return "/\(Constants.API().forecastPath)/\(Constants.API().keyValue)/\(latitude),\(longitude)"
    }
    
    //Excluding hourly, minutely, alerts and flags (keeping daily and current)
    static func getExcludeValue() -> String {
        return "\(Constants.API().queryValueHourly),\(Constants.API().queryValueMinutely),\(Constants.API().queryValueAlerts),\(Constants.API().queryValueFlags)"
    }
    
    static func requestWeatherWith(_ latitude: Double, _ longitude: Double,
                                   success: @escaping (Weather) -> Void,
                                   failed: @escaping (Error?) -> Void){
        
        
        var components = URLComponents()
        components.scheme = Constants.API().schemeURL
        components.host = Constants.API().baseURL
        components.path = APIRequest.getCompletePathWith(latitude, longitude)
        components.queryItems = [
            URLQueryItem(name: Constants.API().queryNameExclude, value: APIRequest.getExcludeValue()),
            URLQueryItem(name: Constants.API().queryNameUnits, value: Constants.API().queryValueUnitCA)
            
        ]

        guard let url = components.url else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                failed(error)
                return
            }

            guard let data = data else {
                failed(nil)
                return
            }

            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                print(data)
                success(weather)
            } catch {
                failed(nil)
            }

        }.resume()
        
    }
}
