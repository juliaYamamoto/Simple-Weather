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
    @IBOutlet weak var degreesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var locationImage: UIImageView!
    
    
    // MARK: - Atributes
    var delegate: TopMenuDelegate?
    var menuIsOpen = false
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    // MARK: - Methods
    func setupConstraints(topConstraint: NSLayoutConstraint, leadingConstrain: NSLayoutConstraint, traillingConstrain: NSLayoutConstraint, menuWillStartOpen: Bool){
        
        if let topMenu = self.view as? TopMenuView {
            topMenu.topConstraint = topConstraint
            topMenu.leadingConstraint = leadingConstrain
            topMenu.traillingConstraint = traillingConstrain
            
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
    
    func setupView() {
        //Degrees Segmented Control
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
