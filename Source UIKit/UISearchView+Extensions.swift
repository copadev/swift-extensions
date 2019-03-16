//
//  UISearchView+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    
    /**
     
     */
    private func getViewElement<T>(type: T.Type) -> T? {
        let svs = subviews.flatMap { $0.subviews }
        guard let element = (svs.filter { $0 is T }).first as? T else { return nil }
        return element
    }
    
    
    /**
     
     */
    func inputFieldAppearance(withColor color: UIColor) {
        guard let textField = getViewElement(type: UITextField.self) else {
            return
        }
        switch searchBarStyle {
        case .minimal:
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 5
            break
            
        case .prominent, .default:
            textField.backgroundColor = color
            break
        }
        
    }
}
