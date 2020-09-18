//
//  MoonPhase.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 17/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

enum MoonPhase {
    case newMoon
    case firtsQuarter
    case fullMoon
    case lastQuarter
    
    static func getMoonType(_ value: Double) -> MoonPhase {
        var moonPhase = MoonPhase.newMoon
        
        if value >= 0 && value <= 0.24 {
            moonPhase = .newMoon
        } else if value >= 0.25 && value <= 0.49 {
            moonPhase = .firtsQuarter
        } else if value >= 0.5 && value <= 0.74 {
            moonPhase = .fullMoon
        } else {
            moonPhase = .lastQuarter
        }
        
        return moonPhase
    }
    
    static func getStateIconImage(_ icon: MoonPhase) -> String {
        switch icon {
        case .firtsQuarter:
            return Constants.StateMoonImage().firstQuarter
        case .newMoon:
            return Constants.StateMoonImage().newMoon
        case .fullMoon:
            return Constants.StateMoonImage().fullMoon
        case .lastQuarter:
            return Constants.StateMoonImage().lastQuarter
        }
    }
}
