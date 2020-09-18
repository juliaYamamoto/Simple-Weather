//
//  BotMenuView.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 08/09/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class BotMenuView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weatherStateImage: UIImageView!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    
    @IBOutlet weak var temperatureMinLabel: UILabel!
    @IBOutlet weak var temperatureMaxLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureFeelsLikeLabel: UILabel!
    
    @IBOutlet weak var humidityValueLabel: UILabel!
    @IBOutlet weak var humidityDescriptionLabel: UILabel!
    @IBOutlet weak var windValueLabel: UILabel!
    @IBOutlet weak var windDescriptionLabel: UILabel!
    @IBOutlet weak var rainValueLabel: UILabel!
    @IBOutlet weak var rainDescriptionLabel: UILabel!
    @IBOutlet weak var moonStateImage: UIImageView!
    @IBOutlet weak var moonDescriptionLabel: UILabel!
    
    @IBOutlet weak var sunriseValueLabel: UILabel!
    @IBOutlet weak var sunriseDescriptionLabel: UILabel!
    @IBOutlet weak var sunsetValueLabel: UILabel!
    @IBOutlet weak var sunsetDescriptionLabel: UILabel!
    
    @IBOutlet weak var darkSkyButton: UIButton!
    
    
    // MARK: - Methods
    
    func setupView() {
        self.titleLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.weatherStatusLabel.textColor = UIColor.MainColorGroup.lightBlue
        
        self.temperatureMinLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.temperatureMaxLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.temperatureLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.temperatureFeelsLikeLabel.textColor = UIColor.MainColorGroup.lightBlue
        
        self.humidityValueLabel.textColor = UIColor.MainColorGroup.darkBlue
        self.humidityDescriptionLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.windValueLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.windDescriptionLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.rainValueLabel.textColor = UIColor.MainColorGroup.darkBlue
        self.rainDescriptionLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.moonDescriptionLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.sunriseValueLabel.textColor = UIColor.MainColorGroup.darkBlue
        self.sunriseDescriptionLabel.textColor = UIColor.MainColorGroup.lightBlue
        
        self.sunsetValueLabel.textColor = UIColor.MainColorGroup.darkBlue
        self.sunsetDescriptionLabel.textColor = UIColor.MainColorGroup.lightBlue
        
        self.darkSkyButton.tintColor = UIColor.MainColorGroup.lightBlue
    }
    
    func setupValues(today: TodayWeather, nextDays: NextDaysWeather){
        self.titleLabel.text = today.day
        self.weatherStateImage.image = UIImage(named: IconWeather.getStateIconImage(today.icon))
        self.weatherStatusLabel.text = today.icon.rawValue
        
        self.temperatureMinLabel.text = today.temperatureMin
        self.temperatureMaxLabel.text = today.temperatureMax
        self.temperatureLabel.text = today.temperature
        self.temperatureFeelsLikeLabel.text = today.apparentTemperature
        
        self.humidityValueLabel.text = today.humidity
        self.windValueLabel.text = today.wind
        self.rainValueLabel.text = today.rain
        self.moonStateImage.image = UIImage(named: MoonPhase.getStateIconImage(today.moonPhase))
        self.sunriseValueLabel.text = today.sunriseTime
        self.sunsetValueLabel.text = today.sunsetTime
    }
}
