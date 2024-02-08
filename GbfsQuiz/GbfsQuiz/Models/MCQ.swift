//
//  MCQ.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import Foundation

class MCQ {
    var question: String
    var options: [String]
    var correctAnswerIndex: Int
    var userSelectedAnswerIndex: Int = -1

    init(question: String, options: [String], correctAnswerIndex: Int) {
        self.question = question
        self.options = options
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    // Method to convert the MCQ instance into a dictionary
        func dictionaryRepresentation() -> [String: Any] {
            let dictionary: [String: Any] = [
                "question": question,
                "options": options,
                "correctAnswerIndex": correctAnswerIndex,
                "userSelectedAnswerIndex": userSelectedAnswerIndex
            ]
            return dictionary
        }
}
