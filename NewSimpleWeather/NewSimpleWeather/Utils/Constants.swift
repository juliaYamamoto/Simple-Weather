//
//  Constants.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 25/07/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class Constants: NSObject {

    public struct API{
        let schemeURL: String = "https"
        let baseURL: String = "api.openweathermap.org"
        
        let dataPath: String = "/data"
        let apiVersion = "/2.5"
        let onecall = "/onecall"
        
        let keyName: String = "appid"
        let keyValue: String = "7b82c01bf433db50a7a373053507692f"
        
        let queryNameLatitude: String = "lat"
        let queryNameLongitude: String = "lon"
        let queryNameExclude: String = "exclude"
        
        let queryValueCurrent: String = "current"
        let queryValueMinutely: String = "minutely"
        let queryValueHourly: String = "hourly"
        let queryValueDaily: String = "daily"
    }
}
