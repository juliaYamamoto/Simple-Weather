//
//  BotMenuViewController.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 08/09/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class BotMenuViewController: UIViewController {
    
    // MARK: - Atributes
    var menuIsOpen = false
    var superview: UIView?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    // MARK: - Methods
    
    func setupView() {
        
    }
    
    func setupConstraints(topConstaint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint, menuWillStartOpen: Bool) {
        if let botMenu = self.view as? BotMenuView {
            botMenu.topConstraint = topConstaint
            botMenu.heightConstraint = heightConstraint
            
            if menuWillStartOpen {
                botMenu.openMenu(animationTime: 0.0, onView: nil) { () -> Void? in
                    self.menuIsOpen = true
                }
            } else {
                botMenu.closeMenu(animationTime: 0.0, onView: nil) { () -> Void? in
                    self.menuIsOpen = false
                }
            }
        }
    }
    
    
    // MARK: - IBActions
    
    @IBAction func openCloseButtonClicked(_ sender: UIButton) {
        if menuIsOpen {
            if let botMenu = self.view as? BotMenuView {
                botMenu.closeMenu(animationTime: 0.3, onView: self.superview) {
                    self.menuIsOpen = false
                }
            }
        } else {
            if let botMenu = self.view as? BotMenuView {
                botMenu.openMenu(animationTime: 0.3, onView: self.superview) {
                    self.menuIsOpen = true
                }
            }
        }
        
    }
    
}
