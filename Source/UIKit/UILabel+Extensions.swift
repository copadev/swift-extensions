//
//  UILabel+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ANIMATION

extension UILabel {
    
    /**
     
     */
    func labelBlinkAnimationStart() {
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
    func labelBlinkAnimationStop() {
        layer.removeAllAnimations()
        alpha = 1
    }
}
