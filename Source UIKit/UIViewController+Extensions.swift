//
//  UIViewController+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /**
     
     */
    func makeRootViewController() {
        let window = UIApplication.shared.delegate!.window!!
        window.rootViewController = self
        UIView.transition(with: window,
                          duration: 0.3,
                          options: [.transitionCrossDissolve],
                          animations: nil,
                          completion: nil)
    }
    
}
