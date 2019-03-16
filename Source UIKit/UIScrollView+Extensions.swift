//
//  UIScrollView+Extension.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    /**
     
     */
    func scrollToTop(animated: Bool = true) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }
    
    
    /**
     
     */
    func scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: animated)
        }
    }
    
    
    /**
     Scroll view with paging
     */
    func scrollToPage(index: UInt8, animated: Bool = true, after delay: TimeInterval) {
        let offset: CGPoint = CGPoint(x: CGFloat(index) * frame.size.width, y: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
            self.setContentOffset(offset, animated: animated)
        })
    }
    
    
    /**
     Scroll to a specific view so that it's top is at the top our scrollview
     */
    func scrollToView(view:UIView, animated: Bool) {
        guard let origin = view.superview else {
            return
        }
        // Get the Y position of your child view
        let childStartPoint = origin.convert(view.frame.origin, to: self)
        // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
        self.scrollRectToVisible(CGRect(x: 0.0, y: childStartPoint.y, width: 1, height: self.frame.height), animated: animated)
    }
    
}
