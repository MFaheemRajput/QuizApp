//
//  Quiz.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import Foundation

struct Quiz {
    var quizId: String
    var userId: String
    var userEmail: String
    var mcqs: [MCQ]
    var attemptedMcqs: [MCQ]
    var points:Int?

    init(quizId:String,userId:String, userEmail:String) {
        self.quizId = quizId
        self.userId = userId
        self.userEmail = userEmail
        self.points = 0
        // Example usage:
        let mcq1 = MCQ(question: "What is the the capital of France?",
                      options: ["Berlin", "Paris", "London", "Rome"],
                       correctAnswerIndex: 1)

        let mcq2 = MCQ(question: "Which planet is known as the Red Planet?",
                      options: ["Earth", "Mars", "Jupiter", "Venus"],
                       correctAnswerIndex: 1)

        let mcq3 = MCQ(question: "What is the largest mammal?",
                      options: ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
                       correctAnswerIndex: 1)

        // You can create an array of MCQs for your quiz
        let mcqArray = [mcq1, mcq2, mcq3]
        
        mcqs = mcqArray
        attemptedMcqs = []
    }
    
    mutating func updateQuiz( _ points: Int){
        self.points = points
    }
    
    // Method to convert the Quiz instance into a dictionary
        func dictionaryRepresentation() -> [String: Any] {
            let dictionary: [String: Any] = [
                "quizId": quizId,
                "userId": userId,
                "userEmail": userEmail,
                "points": points ?? NSNull(),
                "mcqs": mcqs.map { $0.dictionaryRepresentation() }, // Convert each MCQ to dictionary
                "attemptedMcqs": attemptedMcqs.map { $0.dictionaryRepresentation() } // Convert each attempted MCQ to dictionary
            ]
            return dictionary
        }
}
