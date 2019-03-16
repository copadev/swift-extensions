//
//  UIButton+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation
import UIKit

// MARK: - APPEARANCE

extension UIButton {
    
    /**
     
     */
    func buttonBorder(withRadius radius: CGFloat, width: CGFloat, color:UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    
    /**
     
     */
    func buttonTitle(withString string: String, color: UIColor) {
        self.setTitle(string, for: .normal)
        self.setTitle(string, for: .selected)
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(color, for: .selected)
    }
    
    
    /**
     
     */
    func buttonBackgroundColor(withColor color: UIColor) {
        self.backgroundColor = color
    }
    
}



// MARK: - ANIMATION

extension UIButton {
    
    /**
     
     */
    func blinkAnimationStart() {
        UIView.animate(withDuration: 0.8,
                       delay:0.0,
                       options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: {
                        self.alpha = 0
        },
                       completion: nil)
    }
    
    
    /**
     
     */
    func blinkAnimationStop() {
        layer.removeAllAnimations()
        alpha = 1
    }
    
}
