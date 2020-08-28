//
//  WeatherViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 03/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, LocationDelegate {
    
    // MARK: - Attributes
    let location = Location()
    var todayWeather = TodayWeather()
    var nextDays = NextDaysWeather()
    var isMenuOpen = true
    
    
    // MARK: - Outlets - Main screen view
    @IBOutlet var mainScreenView: MainScreenView!
    
    @IBOutlet var topScreenView: TopMenuView!
    @IBOutlet weak var leadingConstraintTopMenu: NSLayoutConstraint!
    @IBOutlet weak var topConstraintTopMenu: NSLayoutConstraint!
    
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        location.delegate = self
        location.setupLocationManagerWithVC()
        
        setupView()
    }
    
    
    // MARK: - Methods
    func createDataModelsFrom(_ weather: Weather){
        self.todayWeather = TodayWeather(from: weather)
        self.nextDays = NextDaysWeather()
        nextDays.creatNextDaysList(from: weather)
    }
    
    func showTodayWeatherInfo() {
        mainScreenView.setupInformations(self.todayWeather)
    }
    
    func setupView() {
        //Set menu as closed
        self.isMenuOpen = true
        self.topScreenView.topConstraint = topConstraintTopMenu
        self.topScreenView.leadingConstraint = leadingConstraintTopMenu
    }
    
    
    // MARK: - IBOutlets
    
    @IBAction func OpenCloseMenu(_ sender: Any) {
        if isMenuOpen {
            self.topScreenView.closeMenu()
            self.isMenuOpen = false
        }
        
        else {
            self.topScreenView.openMenu()
            self.isMenuOpen = true
        }
    }
    
    
    // MARK: - LocationDelegate
    func gotCurrentLocation(latitude: Double, longitude: Double) {
        APIRequest.requestWeatherWith(latitude, longitude) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.createDataModelsFrom(weather)
                    self.showTodayWeatherInfo()
                }
            case .failure(_):
                //TODO - APIError
                break
            }
        }
    }
}
