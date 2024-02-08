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
        
        // Sample MCQ data
        let mcqArray: [MCQ] = [
            MCQ(
                question: "What is the station ID?",
                options: ["1", "2", "3", "4"],
                correctAnswerIndex: 1
            ),
            MCQ(
                question: "How many bikes are available at the station?",
                options: ["3", "15", "13", "0"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "How many bikes are disabled at the station?",
                options: ["3", "15", "13", "0"],
                correctAnswerIndex: 1
            ),
            MCQ(
                question: "How many docks are available at the station?",
                options: ["3", "15", "13", "0"],
                correctAnswerIndex: 2
            ),
            MCQ(
                question: "How many docks are disabled at the station?",
                options: ["3", "15", "13", "0"],
                correctAnswerIndex: 3
            ),
            MCQ(
                question: "When was the station last reported?",
                options: ["1707320069", "0", "no", "true"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "Is the station a charging station?",
                options: ["true", "false"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "What is the status of the station?",
                options: ["IN_SERVICE", "OUT_OF_SERVICE", "no", "true"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "Is the station installed?",
                options: ["true", "false"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "Is the station renting bikes?",
                options: ["true", "false"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "Is the station accepting returned bikes?",
                options: ["true", "false"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "What is the traffic status of the station?",
                options: ["no", "true", "IN_SERVICE", "OUT_OF_SERVICE"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "How many vehicle docks are available at the station?",
                options: ["3", "13", "0", "15"],
                correctAnswerIndex: 1
            ),
            MCQ(
                question: "What types of vehicles are available at the station?",
                options: ["ICONIC", "BOOST", "EFIT", "All of the above"],
                correctAnswerIndex: 3
            ),
            MCQ(
                question: "How many ICONIC vehicles are available at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "How many BOOST vehicles are available at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "How many EFIT vehicles are available at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 1
            ),
            MCQ(
                question: "Which vehicle types are available at the station?",
                options: ["BOOST, EFIT", "ICONIC, BOOST", "EFIT, ICONIC", "All of the above"],
                correctAnswerIndex: 3
            ),
            MCQ(
                question: "How many vehicles of type 'EFIT' are available at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 1
            ),
            MCQ(
                question: "How many vehicles of type 'BOOST' are available at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "How many vehicles of type 'ICONIC' are available at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "How many docks are available for 'EFIT' vehicles at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 1
            ),
            MCQ(
                question: "How many docks are available for 'BOOST' vehicles at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "How many docks are available for 'ICONIC' vehicles at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "What is the vehicle type with the highest count available at the station?",
                options: ["ICONIC", "BOOST", "EFIT"],
                correctAnswerIndex: 2
            ),
            MCQ(
                question: "What is the vehicle type with the lowest count available at the station?",
                options: ["ICONIC", "BOOST", "EFIT"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "What is the sum of available EFIT and BOOST vehicles at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 1
            ),
            MCQ(
                question: "What is the sum of available ICONIC and EFIT vehicles at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 1
            ),
            MCQ(
                question: "What is the sum of available ICONIC and BOOST vehicles at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 0
            ),
            MCQ(
                question: "What is the total count of vehicle docks available at the station?",
                options: ["0", "3", "15", "13"],
                correctAnswerIndex: 3
            )
        ]
        
        
//        let mcq1 = MCQ(question: "What is the the capital of France?",
//                      options: ["Berlin", "Paris", "London", "Rome"],
//                       correctAnswerIndex: 1)
//
//        let mcq2 = MCQ(question: "Which planet is known as the Red Planet?",
//                      options: ["Earth", "Mars", "Jupiter", "Venus"],
//                       correctAnswerIndex: 1)
//
//        let mcq3 = MCQ(question: "What is the largest mammal?",
//                      options: ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
//                       correctAnswerIndex: 1)

        // You can create an array of MCQs for your quiz
        
        
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
