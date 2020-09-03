//
//  WeatherViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 03/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, LocationDelegate, TopMenuDelegate {
    
    // MARK: - Attributes
    let location = Location()
    var todayWeather = TodayWeather()
    var nextDays = NextDaysWeather()
    var topMenuViewController = TopMenuViewController()
    
    
    // MARK: - Outlets - Main screen
    @IBOutlet var mainScreenView: MainScreenView!
    
    
    // MARK: - Outlets - Top Menu
    @IBOutlet weak var leadingConstraintTopMenu: NSLayoutConstraint!
    @IBOutlet weak var topConstraintTopMenu: NSLayoutConstraint!
    @IBOutlet weak var traillingConstraintTopMenu: NSLayoutConstraint!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        location.delegate = self
        location.setupLocationManagerWithVC()
        
        setupView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let topMenuViewController = segue.destination as? TopMenuViewController {
            self.topMenuViewController = topMenuViewController
            self.topMenuViewController.delegate = self
        }
    }
    
    
    // MARK: - Methods
    func createDataModelsFrom(_ weather: Weather){
        self.todayWeather = TodayWeather(from: weather)
        self.nextDays = NextDaysWeather()
    }
    
    func updateTodayWeatherInfo() {
        mainScreenView.setupInformations(self.todayWeather)
    }
    
    func setupView() {
        //Top Menu
        self.topMenuViewController.setupConstraints(topConstraint: topConstraintTopMenu, leadingConstrain: leadingConstraintTopMenu, traillingConstrain: traillingConstraintTopMenu, menuWillStartOpen: false)
    }
    
    
    // MARK: - IBOutlets
    @IBAction func OpenCloseMenu(_ sender: Any) {
        if self.topMenuViewController.menuIsOpen {
            self.topMenuViewController.closeMenu(onView: self.view)
        } else {
            self.topMenuViewController.openMenu(onView: self.view)
        }
    }
    
    // MARK: - TopMenuDelegate
    func temperaturePreferenceChanged() {
        self.todayWeather.updateTemperature()
        self.updateTodayWeatherInfo()
    }
    
    // MARK: - LocationDelegate
    func gotCurrentLocation(latitude: Double, longitude: Double) {
        APIRequest.requestWeatherWith(latitude, longitude) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.createDataModelsFrom(weather)
                    self.updateTodayWeatherInfo()
                }
            case .failure(_):
                //TODO - APIError
                break
            }
        }
    }
}
