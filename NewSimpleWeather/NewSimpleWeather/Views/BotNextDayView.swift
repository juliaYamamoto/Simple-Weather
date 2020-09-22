//
//  BotNextDayView.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 21/09/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class BotNextDayView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateImage: UIImageView!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    func setupView() {
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = true;
        
        self.backgroundColor = UIColor.MainColorGroup.lightBlue
        self.titleLabel.textColor = UIColor.MainColorGroup.darkBlue
        self.minLabel.textColor = UIColor.MainColorGroup.darkBlue
        self.maxLabel.textColor = UIColor.MainColorGroup.darkBlue
    }
    
    func setupValues(nextDay: NextWeather){
        self.titleLabel.text = nextDay.day
        self.stateImage.image = UIImage(named: IconWeather.getStateIconImage(nextDay.icon))
        self.minLabel.text = nextDay.temperatureMin
        self.maxLabel.text = nextDay.temperatureMax
    }
}
