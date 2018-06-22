//
//  StringExtensions.swift
//  string-extensions-demo
//
//  Created by Seasoft on 6/18/18.
//  Copyright © 2018 Huy Duong. All rights reserved.
//

import Foundation
import UIKit

// MARK: - STRING STANDARDIZED

extension String {
    
    /**
     Standardized string with no more than two adjacent white spaces.
     ### Usage example: ###
     `````
     let string: String = "Hello   World!"
     print(string.condenseWhitespace()) // Hello World!
     `````
     - Returns: Whitespace condensed string value from a given string as a string value.
     */
    func condenseWhitespace() -> String {
        return self.components(separatedBy: CharacterSet.whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    
    
    /**
     Capitalize the first letter of a string.
     ### Usage Example: ###
     `````
     let string: String = "hello world!"
     print(string.capitalizeFirstLetter()) // Hello world!
     `````
     - Returns: First letter capitalized string value from a given string as a string value.
     */
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    
    
    /**
     Convert string into camel case.
     ### Usage Example: ###
     `````
     let string: String = "Hello world!"
     print(string.camelCased()) // helloWorld!
     `````
     - Returns: Camel string value from a given string as a string value.
     */
    func camelCased() -> String {
        guard count > 0 else { return self }
        let source = lowercased()
        let first = source[..<source.index(after: source.startIndex)]
        if source.contains(" ") {
            let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
            let camel = connected.replacingOccurrences(of: "\n", with: "")
            let rest = String(camel.dropFirst())
            return first + rest
        }
        let rest = String(source.dropFirst())
        return first + rest
    }
    
    
    
    /**
     Pluralizing string word.
     ### Usage Example: ###
     `````
     let string: String = "country"
     print(string.pluralize()) // countries
     `````
     - Precondition: Also drag the Pluralize.swift file into your project to use this extensions.
     - Author: https://github.com/joshualat/Pluralize.swift
     - Parameter count:
     - Parameter with:
     - Returns: Pluralized string value from a given string as a string value.
     */
    func pluralize(count: Int = 2, with: String = "") -> String {
        guard !(count == 1) else { return self }
        guard with.count != 0 else { return Pluralize.apply(word: self) }
        return with
    }
    
}





// MARK: - STRING VALIDATION

extension String {
    
    /**
     Check if the given string is contained in the current string or not.
     ### Usage Example: ###
     `````
     let string: String = "Hello World!"
     print(string.isContains(string: "Hello")) // true
     `````
     - Parameter string: string need to check.
     - Returns: The satisfied of a given string param within provided string as a bool value.
     */
    func isContains(string: String) -> Bool{
        return self.range(of: string) != nil
    }
    
    
    
    /**
     Check if the given email address is in a validation format or not.
     ### Usage Example: ###
     `````
     let email: String = "apple@mac.com"
     print(email.isValidEmailFormat()) // true
     `````
     - Returns: The satisfied of a given email address with it's rules as a bool value.
     */
    func isValidEmailFormat() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    
    
    /**
     Check if the given password is in a validation format or not.
     ### Usage Example: ###
     `````
     let password: String = "Aa1234-"
     print(password.isValidPasswordFormat()) // true
     `````
     - Note: The regex in this case is checking the entry password must contain upper, lower case characters, at least one number, and between 6 and 32 characters.
     - Returns: The satisfied of a given password with it's rules as a bool value.
     */
    func isValidPasswordFormat() -> Bool {
        let passwordRegex = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[-_+$!#%]).{5,32}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: self) && 6 <= self.count && self.count <= 32
    }
    
    
    
    /**
     Check if the given number is between the range or not.
     ### Usage Example: ###
     `````
     let string: String = "27"
     print(string.isValidInRange(from: 10, to: 100)) // true
     `````
     - Parameter min: start range.
     - Parameter max: end range.
     - Returns: The satisfied of a given string number with the provided range as a bool value.
     */
    func isValidInRange(from min: Double, to max: Double) -> Bool {
        let inputNumber = (self as NSString).doubleValue
        return min <= inputNumber && inputNumber <= max
    }
    
    
    
    /**
     Check if the given string is matched the Regex pattern or not.
     ### Usage Example: ###
     `````
     let pattern: String = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[-_+$!#%]).{5,32}"
     let string: String = "Aa1234-"
     print(string.isMatchedFormat(withRegex: pattern)) // true
     `````
     - Parameter pattern: regular expression rules.
     - Returns: The satisfied of a given string with the Regex pattern as a bool value.
     */
    func isMatchedFormat(withRegex pattern: String) -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    
    
    /**
     Check if string contains one or more emojis.
     ### Usage Example: ###
     `````
     let string: String = "Hello world!! 🤪"
     print(.isContainEmoji()) // true
     `````
     - Author: http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
     - Returns: Emoji contains in the given string as a bool value.
     */
    func isContainEmoji() -> Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9, // Special Characters
            0x1D000...0x1F77F, // Emoticons
            0x2100...0x27BF, // Misc symbols and Dingbats
            0xFE00...0xFE0F, // Variation Selectors
            0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
                return true
            default: continue
            }
        }
        return false
    }
    
}





// MARK: - STRING EXTRACTION

extension String {
    
    /**
     Cut string from start index to a given index of characters.
     ### Usage Example: ###
     `````
     let string: String = "Hello World!"
     print(string.substring(to: 4)) // Hello
     `````
     - Parameter to: index of ending character cut.
     - Returns: String cut from the start index to the given index of characters as a string value.
     */
    func substring(to: Int) -> String {
        guard 0..<count ~= to else { return self }
        return String(self[...self.index(self.startIndex, offsetBy: to)])
    }
    
    
    
    /**
     Cut string from a given index of characters to end index.
     ### Usage Example: ###
     `````
     let string: String = "Hello World!"
     print(string.substring(from: 6)) // World!
     `````
     - Parameter from: index of starting character cut.
     - Returns: String cut from the given index of characters to the end index as a string value.
     */
    func substring(from: Int) -> String {
        guard 0...count ~= from else { return self }
        return String(self[self.index(self.startIndex, offsetBy: from)...])
    }
    
    
    
    /**
     Truncated string (limited to a given number of characters).
     ### Usage Example: ###
     `````
     let string: String = "String extensions very long sentence".
     print(string.truncate(length: 10)) //String ext...
     `````
     - Parameter length: maximum number of characters before cutting.
     - Parameter trailing: string to add at the end of truncated string (default is "...").
     - Returns: Truncated string value from a given string as a string value.
     */
    func truncate(length: Int, trailing: String? = "...") -> String {
        guard 0..<count ~= length else { return self }
        return self[startIndex..<index(startIndex, offsetBy: length)] + (trailing ?? "")
    }
    
    
    
    /**
     Counting of words in a string.
     ### Usage Example: ###
     `````
     let string: String = "Hello World!".
     print(string.wordCount()) // 2
     `````
     - Author: https://stackoverflow.com/questions/42822838
     - Returns: Number of words from a given string as an int value.
     */
    func wordCount() -> Int {
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let comps = components(separatedBy: chararacterSet)
        let words = comps.filter { !$0.isEmpty }
        return words.count
    }
    
    
    
    /**
     Array of words in a string.
     ### Usage Example: ###
     `````
     let string: String = "Hello World!".
     print(string.wordCount()) // ["Hello", "World!"]
     `````
     - Author: https://stackoverflow.com/questions/42822838
     - Returns: The array of words from a given string as an array of string value.
     */
    func toWordsArray() -> [String] {
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let comps = components(separatedBy: chararacterSet)
        return comps.filter { !$0.isEmpty }
    }
    
    
    
    /**
     Extract YouTube video ID from YouTub URLs.
     ### Usage Example: ###
     `````
     let url: String = "https://www.youtube.com/watch?v=WCAh9FBaYW0"
     print(url.extractYoutubeID()) //WCAh9FBaYW0
     `````
     - Returns: Youtube Video ID value from a given URL as an optional string value.
     */
    func extractYoutubeID() -> String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        
        guard let result = regex?.firstMatch(in: self, options: [], range: range) else {
            return nil
        }
        
        return (self as NSString).substring(with: result.range)
    }
    
}





// MARK: - STRING ENCODE & DECODE

extension String {
    
    /**
     Encode emoji.
     ### Usage Example: ###
     `````
     let emoji: String = "🤪"
     print(emoji.encodeEmoji()) //\\ud83e\\udd2a
     `````
     - Returns: Emoji encoded value from a given emoji as an optional string value.
     */
    func encodeEmoji() -> String? {
        let encodedStr = NSString(cString: self.cString(using: String.Encoding.nonLossyASCII)!, encoding: String.Encoding.utf8.rawValue)
        return encodedStr as String?
    }
    
    
    
    /**
     Decode emoji.
     ### Usage Example: ###
     `````
     let emojiCode: String = "\\ud83e\\udd2a"
     print(emojiCode.decodeEmoji()) //🤪
     `````
     - Returns: Emoji decoded value from a given string code as an optional string (emoji) value.
     */
    func decodeEmoji() -> String {
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        if data != nil {
            let valueUniCode = NSString(data: data!, encoding: String.Encoding.nonLossyASCII.rawValue) as String?
            if valueUniCode != nil {
                return valueUniCode!
            } else {
                return self
            }
        } else {
            return self
        }
    }
    
    
    
    /**
     Encode base64 string (if applicable).
     ### Usage Example: ###
     `````
     let string: String = "Hello World!"
     print(string.encodeBase64()) //Optional("SGVsbG8gV29ybGQh")
     `````
     - Author: https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
     - Returns: Base64 encoded value from a given string as an optional string value.
     */
    func encodeBase64() -> String? {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
    
    
    /**
     Decode base64 string (if applicable).
     ### Usage Example: ###
     `````
     let stringCode: String = "SGVsbG8gV29ybGQh"
     print(stringCode.decodeBase64()) //Optional("Hello World!")
     `````
     - Author: https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
     - Returns: Base64 decoded value from a given string code as an optional string value.
     */
    func decodeBase64() -> String? {
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
    
}





// MARK: - STRING & DATE TIME

extension String {
    
    /**
     Convert string to date value (if applicable).
     ### Usage Example: ###
     `````
     let string: String = "2018-06-21 12:30:27"
     print(string.toDate(withFormat "yyyy-MM-dd HH:mm:ss")) //Optional(2018-06-21 05:30:27 +0000)
     `````
     - Parameter format: date format (e.g yyyy-MM-dd HH:mm:ss).
     - Returns: Date value from a given string as an optional date value.
     */
    func toDate(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: self)
    }
    
}





// MARK: - STRING & FLOAT

extension String {
    
    /**
     Convert string to float value (if applicable).
     ### Usage Example: ###
     `````
     let string: String = "37.5"
     print(string.toFloat()) //37.5
     `````
     - Parameter locale: Locale (default is Locale.current).
     - Returns: Float value from a given string as an optional float value.
     */
    func toFloat(locale: Locale = .current) -> Float? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self)?.floatValue
    }
    
}





// MARK: - STRING & CGFLOAT

extension String {
    
    /**
     Convert string to cgFloat value (if applicable).
     ### Usage Example: ###
     `````
     let string: String = "37.5"
     print(string.toCGFloat()) //37.5
     `````
     - Parameter locale: Locale (default is Locale.current).
     - Returns: CGFloat value from a given string as an optional CGFloat value.
     */
    func toCGFloat(locale: Locale = .current) -> CGFloat? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self) as? CGFloat
    }
    
}



// MARK: - STRING & DOUBLE

extension String {
    
    /**
     Convert string to Double value (if applicable).
     ### Usage Example: ###
     `````
     let string: String = "37.5"
     print(string.toDouble()) //37.5
     `````
     - Parameter locale: Locale (default is Locale.current).
     - Returns: Double value from a given string as an optional Double value.
     */
    func toDouble(locale: Locale = .current) -> Double? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self)?.doubleValue
    }
    
}




// MARK: - OTHERS

extension String {
    
    /**
     Copy string to global pasteboard.
     ### Usage Example: ###
     `````
     let string: String = "Hello World!"
     string.copyToPasteboard() // copied "Hello World!" to pasteboard
     `````
     */
    func copyToPasteboard() {
        #if os(iOS)
        UIPasteboard.general.string = self
        #elseif os(macOS)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(self, forType: .string)
        #endif
    }
    
    
    
    /**
     Return the current class name.
     Using for returning tableviewcell class name to call cell indentifier,...
     
     ### Usage Example: ###
     `````
     class var identifier: String { return String.className(self) }
     print(StringExtension.identifier)
     `````
     - Parameter aClass: the current class
     - Returns: The class name as a string value.
     */
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
}



