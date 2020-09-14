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
    
    // MARK: - Outlets - Main screen
    @IBOutlet var mainScreenView: MainScreenView!
    
    
    // MARK: - Outlets - Top Menu
    @IBOutlet weak var leadingConstraintTopMenu: NSLayoutConstraint!
    @IBOutlet weak var topConstraintTopMenu: NSLayoutConstraint!
    @IBOutlet weak var traillingConstraintTopMenu: NSLayoutConstraint!
    
    
    // MARK: - Outlets - Bot Menu
    @IBOutlet weak var botView: UIView!
    
    
    // MARK: - Attributes - Menus
    var topMenuViewController = TopMenuViewController()
    var botMenuViewController = BotMenuViewController()
    
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        location.delegate = self
        location.setupLocationManagerWithVC()
        
        setupSwipeGesture()
        setupView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTop" {
            if let topMenuViewController = segue.destination as? TopMenuViewController {
                self.topMenuViewController = topMenuViewController
                self.topMenuViewController.delegate = self
            }
        }
        else if segue.identifier == "segueToBot" {
            if let botMenuViewController = segue.destination as? BotMenuViewController {
                self.botMenuViewController = botMenuViewController
            }
        }
    }
    
    // MARK: - Methods
    
    func setupSwipeGesture(){
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipe.direction = .up
        self.botView.addGestureRecognizer(swipe)
    }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer){
        openBotMenu()
    }

    
    func openBotMenu(){
        self.botMenuViewController = BotMenuViewController()
        self.performSegue(withIdentifier: "segueToBot", sender: self)
    }
    
    func createDataModelsFrom(_ weather: Weather){
        self.todayWeather = TodayWeather(from: weather)
        self.nextDays = NextDaysWeather()
        self.nextDays.creatNextDaysList(from: weather)
    }
    
    func updateTodayWeatherInfo() {
        mainScreenView.setupInformations(self.todayWeather)
        self.topMenuViewController.updateTodayValues(cityName: self.todayWeather.cityName, countryName: self.todayWeather.countryName)
    }
    
    func setupView() {
        //Top Menu
        self.topMenuViewController.setupConstraints(topConstraint: topConstraintTopMenu, leadingConstraint: leadingConstraintTopMenu, traillingConstraint: traillingConstraintTopMenu, menuWillStartOpen: false)
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
