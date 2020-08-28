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
    
    
//    let screenWidth = UIScreen.main.bounds.size.width
//    self.menuTopConstraint.constant = menuIsOpen ? 160 : 44
//    self.menuTrailingConstraint.constant = menuIsOpen ? (screenWidth - 90) * -1 : -90
//    self.menuLeadingConstraint.constant = menuIsOpen ? (screenWidth - 90) : 0
//    self.locationImageTopContraint.constant = menuIsOpen ? 44 : 130
//
//    UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
//        self.view.layoutIfNeeded()
//    }) { (_) in
//        self.menuIsOpen = !self.menuIsOpen
//    }
    
    func openMenu(){
        guard let topConstraint = self.topConstraint else { return }
        guard let leadingConstraint = self.leadingConstraint else { return }
        
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            topConstraint.constant = 0
            leadingConstraint.constant = 0
            self.layoutIfNeeded()
        }) { (_) in
            //Return and say that the menu is open
        }
    }
    
    func closeMenu() {
        guard let topConstraint = self.topConstraint else { return }
        guard let leadingConstraint = self.leadingConstraint else { return }
        
        let screenWidth = UIScreen.main.bounds.size.width
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            topConstraint.constant = -135
            leadingConstraint.constant = screenWidth - 72
            self.layoutIfNeeded()
        }) { (_) in
            //Return and say that the menu is closed
        }
    }
}
