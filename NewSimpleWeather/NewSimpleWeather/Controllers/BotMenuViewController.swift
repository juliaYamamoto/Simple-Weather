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
    var menuIsOpen = false
    
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
        
    }
}
