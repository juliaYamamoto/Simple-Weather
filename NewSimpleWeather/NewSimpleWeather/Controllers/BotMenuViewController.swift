//
//  BotMenuViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 08/09/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class BotMenuViewController: UIViewController {
    
    // MARK: - Variables
    var todayWeather: TodayWeather?
    var nextDaysWeather: NextDaysWeather?
    
    
    // MARK: - IBOutlet
    @IBOutlet var botView: BotMenuView!
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    // MARK: - Methods
    
    func setupView() {
        guard let today = self.todayWeather else { return }
        guard let next = self.nextDaysWeather else { return }
        
        botView.setupView()
        botView.setupValues(today: today, nextDays: next)
    }
    
    func updateWeatherInfo(today: TodayWeather, nextDays: NextDaysWeather) {
        self.todayWeather = today
        self.nextDaysWeather = nextDays
        
        if self.botView != nil {
            setupView()
        }
    }
}
