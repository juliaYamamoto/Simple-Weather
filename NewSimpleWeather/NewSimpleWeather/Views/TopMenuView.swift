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
    
    func openMenu(){
        guard let topConstraint = self.topConstraint else { return }
        guard let leadingConstraint = self.leadingConstraint else { return }
        
        topConstraint.constant = 0
        leadingConstraint.constant = 0
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.superview?.layoutIfNeeded()
        }) { (_) in
            //Return and say that the menu is open - TODO
        }
    }
    
    func closeMenu() {
        guard let topConstraint = self.topConstraint else { return }
        guard let leadingConstraint = self.leadingConstraint else { return }
        
        let screenWidth = UIScreen.main.bounds.size.width
        topConstraint.constant = -135
        leadingConstraint.constant = screenWidth - 72
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.superview?.layoutIfNeeded()
        }) { (_) in
            //Return and say that the menu is closed  - TODO
        }
    }
}
