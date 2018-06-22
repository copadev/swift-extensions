//
//  StringExtensionsList.swift
//  string-extensions-demo
//
//  Created by Seasoft on 6/19/18.
//  Copyright © 2018 Huy Duong. All rights reserved.
//

import Foundation

/**
 * String extensions list
 */
let extensionsList: [StringExtensions] = [
    
    // MARK: - STRING STANDARDIZED
    
    //Condense whitespace
    StringExtensions(id: 1,
                     name: "Condense whitespace",
                     document: "condense_whitespace",
                     inputDemo: "String  extentions demo    text...",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter)  in
                        return input.condenseWhitespace()
    }),
    
    //Capitalize first letter
    StringExtensions(id: 2,
                     name: "Capitalize first letter",
                     document: "capitalize_first_letter",
                     inputDemo: "string extentions demo text...",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return input.capitalizeFirstLetter()
    }),
    
    //Camel cased
    StringExtensions(id: 3,
                     name: "Camel cased",
                     document: "camel_cased",
                     inputDemo: "String extentions demo  text...",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return input.camelCased()
    }),
    
    //Pluralize
    StringExtensions(id: 4,
                     name: "Pluralize",
                     document: "pluralize",
                     inputDemo: "country",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return input.pluralize()
    }),
    
    // MARK: - STRING VALIDATION
    
    // Is contains?
    StringExtensions(id: 5,
                     name: "Is contains?",
                     document: "is_contains",
                     inputDemo: "String extensions demo  text...",
                     parameter: [
                        (dataType: .text, placeholder: "Enter string to find...", value: "extensions")
        ],
                     outputDemoOf: { (input: String, parameter: [Parameter]?) in
                        guard let parameter = parameter, parameter.count == 1 else {
                            return AppText.noParameterError
                        }
                        guard let textContain: String = parameter[0].value else {
                            return AppText.noParameterError(name: "string")
                        }
                        return String(describing: input.isContains(string: textContain))
    }),

    //Is valid email format?
    StringExtensions(id: 6,
                     name: "Is valid email format?",
                     document: "is_valid_email_format",
                     inputDemo: "apple@mac.com",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return String(describing: input.isValidEmailFormat())
    }),
    
    // Is valid password format?
    StringExtensions(id: 7,
                     name: "Is valid password format?",
                     document: "is_valid_password_format",
                     inputDemo: "Aa1234-",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return String(describing: input.isValidPasswordFormat())
    }),
    
    //Is valid in range?
    StringExtensions(id: 8,
                     name: "Is valid in range?",
                     document: "is_valid_in_range",
                     inputDemo: "37.5",
                     parameter: [
                        (dataType: .number, placeholder: "Enter start range...", value: "0"),
                        (dataType: .number, placeholder: "Enter end range...", value: "100")
        ],
                     outputDemoOf: { (input: String, parameter: [Parameter]?) in
                        guard let parameter = parameter, parameter.count == 2 else {
                            return AppText.noParameterError
                        }
                        guard let param0: String = parameter[0].value, let startRange: Double = Double(param0) else {
                            return AppText.noParameterError(name: "start range")
                        }
                        guard let param1: String = parameter[1].value, let endRange: Double = Double(param1) else {
                            return AppText.noParameterError(name: "end range")
                        }
                        return String(describing: input.isValidInRange(from: startRange, to: endRange))
    }),

    //Is matched regex format?
    StringExtensions(id: 9,
                     name: "Is matched regex format?",
                     document: "is_matched_format",
                     inputDemo: "apple@gmail.com",
                     parameter: [
                        (dataType: .text, placeholder: "Enter regex pattern...", value: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        ],
                     outputDemoOf: { (input: String, parameter: [Parameter]?) in
                        guard let parameter = parameter, parameter.count == 1 else {
                            return AppText.noParameterError
                        }
                        guard let pattern: String = parameter[0].value else {
                            return AppText.noParameterError(name: "regex pattern")
                        }
                        return String(describing: input.isMatchedFormat(withRegex: pattern))
    }),
    
    //Is contain Emoji?
    StringExtensions(id: 10,
                     name: "Is contain Emoji?",
                     document: "is_contain_emoji",
                     inputDemo: "Hello world!! 🤪",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return "\(input.isContainEmoji())"
    }),
    
    // MARK: - STRING EXTRACTION
    
    //Substring to index
    StringExtensions(id: 11,
                     name: "Substring to index",
                     document: "substring_to",
                     inputDemo: "String extensions demo text...",
                     parameter: [
                        (dataType: .number, placeholder: "Enter end index...", value: "9")
        ],
                     outputDemoOf: { (input: String, parameter: [Parameter]?) in
                        guard let parameter = parameter, parameter.count == 1 else {
                            return AppText.noParameterError
                        }
                        guard let param0: String = parameter[0].value, let endIndex: Int = Int(param0) else {
                            return AppText.noParameterError(name: "end index")
                        }
                        return String(describing: input.substring(to: endIndex))
    }),
    
    //Substring from index
    StringExtensions(id: 12,
                     name: "Substring from index",
                     document: "substring_from",
                     inputDemo: "String extensions demo text...",
                     parameter: [
                        (dataType: .number, placeholder: "Enter start index...", value: "7")
        ],
                     outputDemoOf: { (input: String, parameter: [Parameter]?) in
                        guard let parameter = parameter, parameter.count == 1 else {
                            return AppText.noParameterError
                        }
                        guard let param0: String = parameter[0].value, let startIndex: Int = Int(param0) else {
                            return AppText.noParameterError(name: "start index")
                        }
                        return String(describing: input.substring(from: startIndex))
    }),
    
    //Truncate
    StringExtensions(id: 13,
                     name: "Truncate",
                     document: "truncate",
                     inputDemo: "String extensions demo very long text",
                     parameter: [
                        (dataType: .number, placeholder: "Enter length of string...", value: "10"),
                        (dataType: .text, placeholder: "Enter trailing sign...", value: "...")
        ],
                     outputDemoOf: { (input: String, parameter: [Parameter]?) in
                        guard let parameter = parameter, parameter.count == 2 else {
                            return AppText.noParameterError
                        }
                        guard let param0 = parameter[0].value, let legnth: Int = Int(param0) else {
                            return AppText.noParameterError(name: "legnth")
                        }
                        let trailing: String = parameter[1].value ?? "..."
                        return String(describing: input.truncate(length: legnth, trailing: trailing))
    }),
    
    //Word count
    StringExtensions(id: 14,
                     name: "Word count",
                     document: "word_count",
                     inputDemo: "Hello world!!",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return String(describing: input.wordCount())
    }),
    
    //To words array
    StringExtensions(id: 15,
                     name: "To words array",
                     document: "to_words_array",
                     inputDemo: "Hello world!!",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return String(describing: input.toWordsArray())
    }),
    
    //Extract Youtube ID
    StringExtensions(id: 16,
                     name: "Extract Youtube ID",
                     document: "extract_youtube_id",
                     inputDemo: "https://www.youtube.com/watch?v=WCAh9FBaYW0",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return String(describing: input.extractYoutubeID())
    }),
    
    // MARK: - STRING ENCODE & DECODE
    
    // Encode emoji
    StringExtensions(id: 17,
                     name: "Encode emoji",
                     document: "encode_emoji",
                     inputDemo: "🤪",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return String(describing: input.encodeEmoji())
    }),
    
    // Decode emoji
    StringExtensions(id: 18,
                     name: "Decode emoji",
                     document: "decode_emoji",
                     inputDemo: "\\ud83e\\udd2a",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return String(describing: input.decodeEmoji())
    }),
    
    // Encode base64
    StringExtensions(id: 19,
                     name: "Encode base64",
                     document: "encode_base_64",
                     inputDemo: "Hello World!",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return String(describing: input.encodeBase64())
    }),
    
    // Decode emoji
    StringExtensions(id: 20,
                     name: "Decode base64",
                     document: "decode_base_64",
                     inputDemo: "SGVsbG8gV29ybGQh",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return String(describing: input.decodeBase64())
    }),
    
    // MARK: - STRING & DATE TIME
    
    //To Date value
    StringExtensions(id: 21,
                     name: "To Date value",
                     document: "to_date",
                     inputDemo: "2018-06-21 12:30:27",
                     parameter: [
                        (dataType: .text, placeholder: "Enter date format...", value: "yyyy-MM-dd HH:mm:ss")
        ],
                     outputDemoOf: { (input: String, parameter: [Parameter]?) in
                        guard let parameter = parameter, parameter.count == 1 else {
                            return AppText.noParameterError
                        }
                        guard let dateFormat: String = parameter[0].value else {
                            return AppText.noParameterError(name: "date format")
                        }
                        return "\(String(describing: input.toDate(withFormat: dateFormat)))"
    }),
    
    // MARK: - STRING & FLOAT
    
    //To Float value
    StringExtensions(id: 22,
                     name: "To Float value",
                     document: "to_float",
                     inputDemo: "37.5",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return "\(String(describing: input.toFloat()))"
    }),
    
    // MARK: - STRING & CGFLOAT
    
    //To CGFloat value
    StringExtensions(id: 23,
                     name: "To CGFloat value",
                     document: "to_cgfloat",
                     inputDemo: "37.5",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return "\(String(describing: input.toCGFloat()))"
    }),
    
    // MARK: - STRING & DOUBLE
    
    //To Double value
    StringExtensions(id: 24,
                     name: "To Double value",
                     document: "to_double",
                     inputDemo: "37.5",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        return "\(String(describing: input.toDouble()))"
    }),
    
    // MARK: - OTHER
    
    //Copy to pasteboard
    StringExtensions(id: 25,
                     name: "Copy to pasteboard",
                     document: "copy_to_pasteboard",
                     inputDemo: "String extensions demo text...",
                     parameter: nil,
                     outputDemoOf: { (input: String, parameter) in
                        input.copyToPasteboard()
                        return "Copied to pasteboard..."
    })
    
]





















