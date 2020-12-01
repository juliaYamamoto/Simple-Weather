//
//  NoInternetView.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 2020-11-13.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class NoInternetView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    
    // MARK: - Methods
    func setupView() {
        self.backgroundColor = UIColor.MainColorGroup.darkBlue
        
        self.titleLabel.textColor = UIColor.MainColorGroup.lightBlue
        self.descriptionLabel.textColor = UIColor.MainColorGroup.lightBlue
        
        self.tryAgainButton.layer.cornerRadius = 5;
        self.tryAgainButton.layer.masksToBounds = true;
        self.tryAgainButton.backgroundColor = UIColor.MainColorGroup.lightBlue
    }
    
    func hideView(){
        self.isUserInteractionEnabled = false
        self.isHidden = true
    }
    
    func showView(){
        self.isUserInteractionEnabled = true
        self.isHidden = false
    }
    
}

