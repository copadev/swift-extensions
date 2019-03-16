//
//  Double+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.


import Foundation

// MARK: -

extension Double {
    
    /**
     
     */
    func rounded(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    
    /**
     
     */
    func dateFromTimestamp() -> Date? {
        let date = Date(timeIntervalSince1970: self)
        return date
    }
    
    
    /**
     
     */
    func string_yyyy_MM_FromTimestamp() -> String? {
        let date = Date(timeIntervalSince1970: self)
        let formatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy - MM"
            dateFormatter.timeZone = Calendar.current.timeZone
            dateFormatter.locale = Calendar.current.locale
            return dateFormatter
        }()
        return formatter.string(from: date)
    }

}
