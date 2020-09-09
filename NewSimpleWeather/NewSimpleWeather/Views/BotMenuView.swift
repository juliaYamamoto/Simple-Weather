//
//  BotMenuView.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 08/09/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class BotMenuView: UIView {
    
    // MARK: - Constraints
    var topConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    
    // MARK: - Methods
    
    func openMenu(animationTime: Double = 0.3, onView: UIView? = nil, animationFinished: @escaping() -> Void?){
        guard let topConstraint = self.topConstraint else { return }
        topConstraint.constant = 60
        
        UIView.animate(withDuration: animationTime, delay: 0, options: [], animations: {
            onView?.layoutIfNeeded()
        }) { (_) in
            animationFinished()
        }
    }
    
    func closeMenu(animationTime: Double = 0.3, onView: UIView? = nil, animationFinished: @escaping() -> Void?){
        let screenHeight = UIScreen.main.bounds.size.height
        guard let topConstraint = self.topConstraint else { return }
        
        topConstraint.constant = screenHeight - 60
        
        UIView.animate(withDuration: animationTime, delay: 0, options: [], animations: {
            onView?.layoutIfNeeded()
        }) { (_) in
            animationFinished()
        }
    }
    
    
}
