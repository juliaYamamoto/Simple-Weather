//
//  UIView.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 02/09/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
