//
//  QuizView.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 06/02/2024.
//

import SwiftUI

struct MultipleChoiceQuestionView: View {
    var mcq:MCQ
    @State private var selectedOption: Int?
    @Binding var questionIndex: Int
    let onAttempt: () -> Void

    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text(mcq.question)
                    .font(.title)
                    .foregroundColor(.black)
                
                ForEach(0..<mcq.options.count, id: \.self) { index in
                    Button(action: {
                        selectedOption = index
                        mcq.userSelectedAnswerIndex = index
                        onAttempt() // Call the closure when an option is selected
                    }) {
                        HStack {
                            
                            if selectedOption == index {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray)
                            }
                            Text(mcq.options[index])
                                .foregroundColor(.black)
                        }
                    }
                }

                if selectedOption != nil {
                    Button("Next", action: {
                        // Reset selectedOption
                        selectedOption = nil
                        // Load the next question
                        questionIndex += 1
                        // Here, you can implement the logic to load the next question
                        // For demonstration, I'm printing a message
                        print("Loading next question...")
                    })
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
            }
            .padding()
        }
    }

