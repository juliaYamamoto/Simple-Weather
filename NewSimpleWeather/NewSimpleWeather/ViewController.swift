//
//  ViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 23/07/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuTopConstraint: NSLayoutConstraint!
    
    
    // MARK: - Atributes
    var menuIsOpen = false
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    // MARK: - Methods
    
    func setupView() {
        self.menuIsOpen = false
        
        let screenWidth = UIScreen.main.bounds.size.width
        self.menuTopConstraint.constant = 160
        self.menuTrailingConstraint.constant = (screenWidth - 90) * -1
        self.menuLeadingConstraint.constant = (screenWidth - 90)
        self.view.layoutIfNeeded()
    }
    
    
    // MARK: - IBAction
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        let screenWidth = UIScreen.main.bounds.size.width
        self.menuTopConstraint.constant = menuIsOpen ? 160 : 44
        self.menuTrailingConstraint.constant = menuIsOpen ? (screenWidth - 90) * -1 : -90
        self.menuLeadingConstraint.constant = menuIsOpen ? (screenWidth - 90) : 0
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.view.layoutIfNeeded()
        }) { (bool) in
            self.menuIsOpen = !self.menuIsOpen
        }
    }
}
