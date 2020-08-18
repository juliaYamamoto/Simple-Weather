//
//  MainScreenView.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 18/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class MainScreenView: UIView {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var stateIconImage: UIImageView!
    @IBOutlet weak var stateDescriptionLabel: UILabel!
    @IBOutlet weak var divisionView: UIView!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var humidityImage: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var rainImage: UIImageView!
    @IBOutlet weak var rainLabel: UILabel!
    
    func setupInformations(_ todayWeather: TodayWeather) {
        cityLabel.text = todayWeather.cityName
        countryLabel.text = todayWeather.contryName
        stateIconImage.image = UIImage(named: getStateIconImage(todayWeather.icon))
        stateDescriptionLabel.text = todayWeather.icon.rawValue
        degreesLabel.text = todayWeather.temperature
        humidityLabel.text = todayWeather.humidity
        rainLabel.text = todayWeather.rain
    }
    
    
    func getStateIconImage(_ icon: IconWeather) -> String{
        switch icon {
        case .clearDay:
            return Constants.StateIconImage().clearDay
        case .clearNight:
            return Constants.StateIconImage().clearNight
        case .rain:
            return Constants.StateIconImage().rain
        case .snow:
            return Constants.StateIconImage().snow
        case .sleet:
            return Constants.StateIconImage().sleet
        case .wind:
            return Constants.StateIconImage().wind
        case .fog:
            return Constants.StateIconImage().fog
        case .cloudy:
            return Constants.StateIconImage().cloudy
        case .partlyCloudyDay:
            return Constants.StateIconImage().partlyCloudyDay
        case .partlyCloudyNight:
            return Constants.StateIconImage().partlyCloudyNight
        }
    }
}


