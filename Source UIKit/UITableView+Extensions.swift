//
//  UITableView+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    /**
     
     */
    func scrollToLastCell() {
        let sections = self.numberOfSections
        let rows = self.numberOfRows(inSection: sections - 1)
        if sections > 0 && rows > 0 {
            let indexPath = IndexPath(row: rows - 1, section: sections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
}
