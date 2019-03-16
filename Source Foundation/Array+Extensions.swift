//
//  Array+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation


extension Array where Element: Hashable {
    
    /**
     
     */
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    
    
    /**
     
     */
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
    
}
