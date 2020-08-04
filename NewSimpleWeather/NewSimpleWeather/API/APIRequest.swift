//
//  APIRequest.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 29/07/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class APIRequest: NSObject {
    
    static func getCompletePath() -> String {
        return "/\(Constants.API().dataPath)\(Constants.API().apiVersion)\(Constants.API().onecall)"
    }
    
    //Excluding hourly and minutely (keeping daily and current)
    static func getExcludeValue() -> String {
        return "\(Constants.API().queryValueHourly),\(Constants.API().queryValueMinutely)"
    }
    
    //https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}& exclude={part}&appid={YOUR API KEY}
    
    
    static func requestWeatherWith(_ latitude: Double, _ longitude: Double,
                                   success: @escaping (Weather) -> Void,
                                   failed: @escaping (Error?) -> Void){
        
        
        var components = URLComponents()
        components.scheme = Constants.API().schemeURL
        components.host = Constants.API().baseURL
        components.path = APIRequest.getCompletePath()
        components.queryItems = [
            URLQueryItem(name: Constants.API().queryNameLatitude, value: latitude.description),
            URLQueryItem(name: Constants.API().queryNameLongitude, value: longitude.description),
            URLQueryItem(name: Constants.API().queryNameExclude, value:getExcludeValue() ),
            URLQueryItem(name: Constants.API().keyName, value: Constants.API().keyValue)
        ]

        guard let url = components.url else {return}
        print(url)
        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                completionFailed(error)
//                return
//            }
//
//            guard let data = data else {
//                completionFailed(nil)
//                return
//            }
//
//            do {
//                //Decode
//                let weather = try JSONDecoder().decode(Weather.self, from: data)
//                completionSuccess(weather)
//            } catch {
//                completionFailed(nil)
//            }
//
//        }.resume()
        
    }
}
