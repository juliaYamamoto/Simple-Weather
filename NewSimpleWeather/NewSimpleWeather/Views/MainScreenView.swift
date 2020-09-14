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
    @IBOutlet weak var botMenuView: UIView!
    @IBOutlet weak var botMenuButton: UIButton!
    @IBOutlet weak var topMenuViewButton: UIButton!
    
    func setupView() {
        self.backgroundColor = UIColor.MainColorGroup.lightBlue
        cityLabel.textColor = UIColor.MainColorGroup.darkBlue
        countryLabel.textColor = UIColor.MainColorGroup.darkBlue
        stateDescriptionLabel.textColor = UIColor.MainColorGroup.darkBlue
        divisionView.backgroundColor = UIColor.MainColorGroup.darkBlue
        degreesLabel.textColor = UIColor.MainColorGroup.darkBlue
        humidityLabel.textColor = UIColor.MainColorGroup.lightBlue
        rainLabel.textColor = UIColor.MainColorGroup.lightBlue
        botMenuView.backgroundColor = UIColor.MainColorGroup.darkBlue
        botMenuButton.imageView?.tintColor = UIColor.MainColorGroup.lightBlue
        topMenuViewButton.imageView?.tintColor = UIColor.MainColorGroup.lightBlue
    }
    
    
    func setupInformations(_ todayWeather: TodayWeather) {
        cityLabel.text = todayWeather.cityName
        countryLabel.text = todayWeather.countryName
        stateIconImage.image = UIImage(named: getStateIconImage(todayWeather.icon))
        stateDescriptionLabel.text = todayWeather.icon.rawValue
        degreesLabel.text = todayWeather.temperature
        humidityLabel.text = todayWeather.humidity
        rainLabel.text = todayWeather.rain
    }
    
    func getStateIconImage(_ icon: IconWeather) -> String {
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


