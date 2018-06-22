//
//  StringExtensionsObject.swift
//  string-extensions-demo
//
//  Created by Seasoft on 6/20/18.
//  Copyright © 2018 Huy Duong. All rights reserved.
//

import Foundation

enum DataType {
    case text
    case number
}

typealias Parameter = (dataType: DataType, placeholder: String, value: String?)
typealias OutputClosure = (_ input: String, _ parameter: [Parameter]?) -> String?


/**
 * String Extensions Object
 */
class StringExtensions {
    
    let id: Int
    let name: String
    let document: String
    let inputDemo: String
    let parameter: [Parameter]?
    let outputDemoOf: OutputClosure
    
    init(id: Int,
         name: String,
         document: String,
         inputDemo: String,
         parameter: [Parameter]?,
         outputDemoOf: @escaping OutputClosure) {
        
        self.id = id
        self.name = name
        self.document = document
        self.inputDemo = inputDemo
        self.parameter = parameter
        self.outputDemoOf = outputDemoOf
        
    }
    
}


public struct AppText {
    
    static let noInputTextDemoError: String = "Please provide input text for demoing..."
    static let noParameterError: String = "Please provide the parameters (Adjustment button on the top right corner)..."
    
    static func noParameterError(name parameter: String) -> String {
        return "Please provide '\(parameter)' parameter..."
    }
    
}


