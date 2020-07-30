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
        return "\(Constants.API().forecastPath)/\(Constants.API().idkey)/\(latitude),\(longitude)"
    }

    static func requestWeatherWith(latitude: Double, longitude: Double,
                                   completionSuccess: @escaping (Weather) -> Void,
                                   completionFailed: @escaping (Error?) -> Void){
        
        var components = URLComponents()
        components.scheme = Constants.API().schemeURL
        components.host = Constants.API().baseURL
        components.path = APIRequest.getCompletePathWith(latitude, longitude)

        guard let url = components.url else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completionFailed(error)
                return
            }
            
            guard let data = data else {
                completionFailed(nil)
                return
            }

            do {
                //Decode
                let weather = try! JSONDecoder().decode(Weather.self, from: data)
                completionSuccess(weather)
            }
            catch {
                completionFailed(nil)
            }
            
        }.resume()
        
    }
}
