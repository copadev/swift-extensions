//
//  Int+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//


import Foundation


 // MARK: -

extension Int {
   
    /**
     
     */
    func dateFromTimestamp() -> Date? {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        return date
    }
    
}
