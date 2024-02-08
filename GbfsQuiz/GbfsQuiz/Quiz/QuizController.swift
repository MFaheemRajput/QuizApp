//
//  ContentView.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import SwiftUI
import FirebaseAuth

struct QuizController: View {
    @ObservedObject var viewModel = QuizControllerVM(initialTime: countDownTimer)
    @State private var navigateToLoginView = false
    @State private var isShowingLoaderboard = false // State variable to control the navigation
    @State private var currentQuestionIndex = 0
    @State private var quiz:Quiz
    @State private var point = 1
    
    let mcq1 = MCQ(question: "What is the capital of France?",
               
                   options: ["Berlin", "Paris", "London", "Rome"],
                   correctAnswerIndex: 1)
    
    let mcq2 = MCQ(question: "Which planet is known as the Red Planet?",
                   options: ["Earth", "Mars", "Jupiter", "Venus"],
                   correctAnswerIndex: 1)
    
    let mcq3 = MCQ(question: "What is the largest mammal?",
                   options: ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
                   correctAnswerIndex: 1)
    
    init() {
        let email = Auth.auth().currentUser?.email
        let a = Auth.auth().currentUser?.uid
        quiz = Quiz(quizId: UUID().uuidString, userId: a!, userEmail: email! )
        quiz.mcqs = [mcq1,mcq2,mcq3]
        quiz.attemptedMcqs = [MCQ]()
        quiz.points = 0
    }
    
    private func saveScore(){
        Task {
            let points = viewModel.calculatePointsForQuestions(attemptedQuestions: quiz.attemptedMcqs)
            quiz.updateQuiz(points)
            await viewModel.saveQuizData(quiz: quiz)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Your landing view content here
                Text("Time Remaining: \(viewModel.timeRemaining)")
                    .font(.headline)
                    .padding()
                if(viewModel.timeRemaining > 0){
                    if currentQuestionIndex < self.quiz.mcqs.count {
                        MultipleChoiceQuestionView(mcq: quiz.mcqs[currentQuestionIndex], questionIndex: $currentQuestionIndex){
                            // Closure to inform ContentView about the attempted question
                            quiz.attemptedMcqs.append(quiz.mcqs[currentQuestionIndex])
                        }
                        Spacer()
                        Text("Attempted \(quiz.attemptedMcqs.count) Questions from \(quiz.mcqs.count) ")
                            .padding()
                        
                    } else {
                        ResultView(points: viewModel.calculatePointsForQuestions(attemptedQuestions: quiz.attemptedMcqs))
                    }
                    
                } else {
                    ResultView(points: viewModel.calculatePointsForQuestions(attemptedQuestions: quiz.attemptedMcqs))
                }
                
                Button("Signout") {
                    viewModel.signout()
                    viewModel.stopTimer()
                    navigateToLoginView = viewModel.isSignout
                }
                .padding()
                
                // Button to navigate to the LeaderBoard view
                Button(action: {
                    isShowingLoaderboard = true // Set the state variable to true to trigger navigation
                }) {
                    Text("Go to LeaderBoard")
                }
                .padding()
                
                
                // NavigationLink to the LoginView
                NavigationLink(
                    destination: LoginView(), // Destination view
                    isActive: $navigateToLoginView // Binding to the state variable
                ){
                    EmptyView() // Placeholder label, since we're using isActive
                }
                
                // Navigation link to the Scoreboard view
                NavigationLink(
                    destination: LeaderBoardView(), // Destination view
                    isActive: $isShowingLoaderboard // Binding to the state variable
                ) {
                    EmptyView() // Invisible view used to trigger navigation
                }
                .hidden() // Hide the NavigationLink from the UI
                
            }
            .navigationTitle("Quiz")
            .navigationBarHidden(true)
            .padding()
            .onChange(of: viewModel.timeRemaining, perform: { newValue in
                if(viewModel.timeRemaining <= 0){
                    saveScore()
                }
            })
            .onDisappear {
                viewModel.stopTimer() // Stop the timer when the view disappears
            }.onAppear {
                viewModel.startTimer()
                // Start the timer when the view appears
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QuizController()
}
