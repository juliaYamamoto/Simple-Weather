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
        let baseURL: String = "api.darksky.net"
        
        let forecastPath: String = "forecast"
        let keyValue: String = "8be6ee97dfdc80b35ee98a2ec52b938d"
        
        let queryNameExclude: String = "exclude"
        let queryValueCurrently: String = "currently"
        let queryValueMinutely: String = "minutely"
        let queryValueHourly: String = "hourly"
        let queryValueDaily: String = "daily"
        let queryValueAlerts: String = "alerts"
        let queryValueFlags: String = "flags"
        
        let queryNameUnits: String = "units"
        let queryValueUnitCA: String = "ca"
    }
}
