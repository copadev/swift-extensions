//
//  UITextView+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    /**
     
     */
    func textViewBorder(withRadius radius: CGFloat, width: CGFloat, color:UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }
    
    
    /**
     
     */
    func textViewBackgroundColor(withColor color:UIColor) {
        self.backgroundColor = color
    }
    
}
