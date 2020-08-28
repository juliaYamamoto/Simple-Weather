//
//  TopMenuView.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 27/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class TopMenuView: UIView {

    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    
    func setup(topConstraint: NSLayoutConstraint, leadingConstrain: NSLayoutConstraint, menuWillStartOpen: Bool){
        self.topConstraint = topConstraint
        self.leadingConstraint = leadingConstrain
        if menuWillStartOpen {
            self.openMenu(animationTime: 0.0)
        } else {
            self.closeMenu(animationTime: 0.0)
        }
    }
    
    func openMenu(animationTime: Double = 0.3){
        guard let topConstraint = self.topConstraint else { return }
        guard let leadingConstraint = self.leadingConstraint else { return }
        
        topConstraint.constant = 0
        leadingConstraint.constant = 0
        
        UIView.animate(withDuration: animationTime, delay: 0, options: [], animations: {
            self.superview?.layoutIfNeeded()
        }) { (_) in
            //Return and say that the menu is open - TODO
        }
    }
    
    func closeMenu(animationTime: Double = 0.3) {
        guard let topConstraint = self.topConstraint else { return }
        guard let leadingConstraint = self.leadingConstraint else { return }
        
        let screenWidth = UIScreen.main.bounds.size.width
        topConstraint.constant = -135
        leadingConstraint.constant = screenWidth - 72
        
        UIView.animate(withDuration: animationTime, delay: 0, options: [], animations: {
            self.superview?.layoutIfNeeded()
        }) { (_) in
            //Return and say that the menu is closed  - TODO
        }
    }
}
