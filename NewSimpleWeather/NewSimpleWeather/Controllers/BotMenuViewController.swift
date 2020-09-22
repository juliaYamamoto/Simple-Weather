//
//  BotMenuViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 08/09/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

enum MenuState {
    case today
    case nextDays
}

class BotMenuViewController: UIViewController {
    
    // MARK: - Variables
    var todayWeather: TodayWeather?
    var nextDaysWeather: NextDaysWeather?
    var botMenuState: MenuState = .today
    
    
    // MARK: - IBOutlet
    
    @IBOutlet var botView: BotMenuView!
    
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var nextDaysButton: UIButton!
    @IBOutlet weak var todayStackViewVerticalConstraint: NSLayoutConstraint!
    
    
    
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
        
        todayStackViewVerticalConstraint.constant = 0 //-500
        updateButtons()
        
    }
    
    func updateButtons() {
        if self.botMenuState == .today {
            self.todayButton.alpha = 0
            self.nextDaysButton.alpha = 1
        } else {
            self.todayButton.alpha = 1
            self.nextDaysButton.alpha = 0
        }
    }
    
    func updateWeatherInfo(today: TodayWeather, nextDays: NextDaysWeather) {
        self.todayWeather = today
        self.nextDaysWeather = nextDays
        
        if self.botView != nil {
            setupView()
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func nextDaysClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.todayStackViewVerticalConstraint.constant = -500
            self.view.layoutIfNeeded()
        }) { _ in
            self.botMenuState = .nextDays
            self.updateButtons()
        }

    }
    
    @IBAction func todayClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.todayStackViewVerticalConstraint.constant = 0
            self.view.layoutIfNeeded()
        }) { _ in
            self.botMenuState = .today
            self.updateButtons()
        }

    }
    
    @IBAction func darkSkyButton(_ sender: Any) {
        #warning("TODO - Fix string constants")
        let openWebsiteAlert = UIAlertController(title: "Open 'Dark Sky' website?", message: "This action will take you out of the app, do you wish to continue?", preferredStyle: .alert)
        
        openWebsiteAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            if let url = URL(string: "https://darksky.net/poweredby/") {
                UIApplication.shared.open(url, options: [:])
            }
        }))
        openWebsiteAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            return
        }))
        
        present(openWebsiteAlert, animated: true, completion: nil)
    }
}
