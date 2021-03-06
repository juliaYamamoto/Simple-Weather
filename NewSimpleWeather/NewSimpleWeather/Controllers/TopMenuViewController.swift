//
//  TopMenuViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 26/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

protocol TopMenuDelegate {
    func temperaturePreferenceChanged()
}

class TopMenuViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var topMeuView: TopMenuView!
    @IBOutlet weak var degreesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    // MARK: - Atributes
    var delegate: TopMenuDelegate?
    var menuIsOpen = false
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topMeuView.setupView()
        setupTemperaturePreference()
    }
    
    
    // MARK: - Methods
    func setupConstraints(topConstraint: NSLayoutConstraint, leadingConstraint: NSLayoutConstraint, traillingConstraint: NSLayoutConstraint, menuWillStartOpen: Bool){
        
        if let topMenu = self.view as? TopMenuView {
            topMenu.topConstraint = topConstraint
            topMenu.leadingConstraint = leadingConstraint
            topMenu.traillingConstraint = traillingConstraint
            
            if menuWillStartOpen {
                showLocationImage()
                topMenu.openMenu(animationTime: 0.0, onView: nil) { () -> Void? in
                    self.menuIsOpen = true
                }
            } else {
                hideLocationImage()
                topMenu.closeMenu(animationTime: 0.0, onView: nil) { () -> Void? in
                    self.menuIsOpen = false
                }
            }
        }
    }
    
    func updateTodayValues(cityName: String, countryName: String){
        self.cityLabel.text = cityName
        self.countryLabel.text = countryName
    }
    
    func setupTemperaturePreference() {
        switch Temperature.getPreference() {
        case .celsius:
            degreesSegmentedControl.selectedSegmentIndex = 0
        case .fahrenheit:
            degreesSegmentedControl.selectedSegmentIndex = 1
        }
    }
    
    func showLocationImage(){
        UIView.animate(withDuration: 0.3) {
            self.locationImage.alpha = 1
        }
    }
    
    func hideLocationImage(){
        UIView.animate(withDuration: 0.3) {
            self.locationImage.alpha = 0
        }
    }
    
    func openMenu(animationTime: Double = 0.3, onView: UIView){
        if let topMenu = self.view as? TopMenuView {
            showLocationImage()
            topMenu.openMenu(animationTime: animationTime, onView: onView) {
                self.menuIsOpen = true
            }
        }
    }
    
    func closeMenu(animationTime: Double = 0.3, onView: UIView){
        if let topMenu = self.view as? TopMenuView {
            hideLocationImage()
            topMenu.closeMenu(animationTime: animationTime, onView: onView) {
                self.menuIsOpen = false
            }
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
        
        if let delegate = self.delegate {
            delegate.temperaturePreferenceChanged()
        }
    }
}
