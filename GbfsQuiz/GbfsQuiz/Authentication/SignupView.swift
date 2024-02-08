//
//  SignupView.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel = SignupViewVM()
    @State private var showErrorToast = true
    
    var body: some View {
        VStack {
            
            // Toast
            if showErrorToast {
                Tost(message: viewModel.errorMessage, backgroundColor: Color.blue)
                    .animation(.easeInOut(duration: 0.5))
                    .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation {
                                            showErrorToast = false
                                        }
                                    }
                                }
                        }
                        Spacer()
            
            TextField("Email", text: $viewModel.email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $viewModel.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Sign Up") {
                //loader start
                viewModel.signUp()
                showErrorToast = !viewModel.errorMessage.isEmpty
            }
            .padding()
            
            if(viewModel.isSignup){
                QuizController()
            }
        }
        .padding()
    }
}

#Preview {
    SignupView()
}
