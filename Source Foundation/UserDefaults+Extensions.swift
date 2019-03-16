//
//  UserDefaults+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation

// MARK: -

extension UserDefaults {
    
    /**
     
     */
    class func isUserLoggedIn() -> Bool {
        if self.standard.object(forKey: "kIS_USER_LOGGED_IN") != nil {
            return self.standard.bool(forKey: "kIS_USER_LOGGED_IN")
        } else {
            self.setUserLoggedIn(flag: false)
            return false
        }
    }
    
    
    /**
     
     */
    class func setUserLoggedIn(flag: Bool) {
        self.standard.set(flag, forKey: "kIS_USER_LOGGED_IN")
    }
    
}
