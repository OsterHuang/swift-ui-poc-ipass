//
//  StringExt.swift
//  ipass
//
//  Created by Oster Huang on 18/01/2023.
//

import Foundation

extension String {
    
    //To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    //Validate Email
    var isTwId: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[A-Z]{1}\\d{9}$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
}
