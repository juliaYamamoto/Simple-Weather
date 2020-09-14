//
//  UIColor.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 24/07/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    struct MainColorGroup {
        static let lightBlue = UIColor(red: 206, green: 243, blue: 251)
        static let mediumBlue = UIColor(red: 155, green: 203, blue: 227)
        static let darkBlue = UIColor(red: 66, green: 86, blue: 102)
        static let darkYellow = UIColor(red: 255, green: 214, blue: 28)
    }

}

