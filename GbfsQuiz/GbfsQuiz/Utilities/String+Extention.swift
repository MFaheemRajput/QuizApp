//
//  String+Extention.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 06/02/2024.
//

import Foundation

extension String {
    func removingLeadingTrailingWhitespace() -> String {
        return trimmingCharacters(in: .whitespaces)
    }
    
    func isValidEmail() -> Bool {
            // Regular expression pattern for email validation
            let pattern = "^[\\w-\\.+]+@([\\w-]+\\.)+[\\w-]{2,4}$"

            // Create a regular expression object
            guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
                return false // Invalid pattern
            }

            // Match the regular expression against the string
            let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
            return !matches.isEmpty
        }
}
