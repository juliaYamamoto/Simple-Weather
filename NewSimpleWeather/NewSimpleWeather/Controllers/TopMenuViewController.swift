//
//  TopMenuViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 26/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class TopMenuViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var degreesSegmentedControl: UISegmentedControl!
    
    
    // MARK: - Atributes
    var menuIsOpen = false //TODO - update
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


    // MARK: - Methods
    
    func setupView() {
        self.menuIsOpen = false //TODO - update
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.MainColorGroup.darkBlue,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 18)!
        ]
        degreesSegmentedControl.backgroundColor = UIColor.MainColorGroup.lightBlue
        degreesSegmentedControl.selectedSegmentTintColor = UIColor.white
        degreesSegmentedControl.setTitleTextAttributes(attributes, for: .normal)
        
        switch Temperature.getPreference() {
        case .celsius:
            degreesSegmentedControl.selectedSegmentIndex = 0
        case .fahrenheit:
            degreesSegmentedControl.selectedSegmentIndex = 1
        }
    }
    
    
    // MARK: - IBOutlet
    
    @IBAction func changeTemperaturePreference(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: //Celsius
            Temperature.setPreference(.celsius)
            break
        case 1: //Fahrenheit
            Temperature.setPreference(.fahrenheit)
            break
            
        default: //Celsius
            Temperature.setPreference(.celsius)
            break
        }
    }
}
