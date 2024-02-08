//
//  QuizViewVM.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import Foundation
import SwiftUI
import Firebase

class QuizControllerVM: ObservableObject {
    @Published var timeRemaining: Int
    @Published var isSignout: Bool
    var timer: Timer?

    init(initialTime: Int) {
        self.timeRemaining = initialTime
        self.isSignout = false
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                print("\(self.timeRemaining)")
            } else {
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func signout(){
        do {
            try Auth.auth().signOut()
            User.currentUser.isLogin = false
            isSignout = true
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func calculatePointsForQuestions(attemptedQuestions: [MCQ]) -> Int {
        var points = 0
        for question in attemptedQuestions {
            if question.correctAnswerIndex >= 0 && question.correctAnswerIndex < question.options.count {
                // Check if the selected option matches the correct answer index
                let selectedOptionIndex = question.userSelectedAnswerIndex
                if selectedOptionIndex != -1 {
                    if selectedOptionIndex == question.correctAnswerIndex {
                        // Correct answer
                        points += 50
                    } else {
                        // Wrong answer
                        points -= 20
                    }
                }
            }
        }
        
        return points
    }
    
    func saveQuizData(quiz:Quiz) async {
        
        await DAO.shared.addData(quiz: quiz, collectionName: scoreBoard)
        
    }
}
