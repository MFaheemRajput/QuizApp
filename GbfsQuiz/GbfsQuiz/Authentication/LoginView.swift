//
//  LoginView.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewVM()
    @State private var navigateToQuizView = false
    @State private var showErrorToast = false
    @State private var errorMessage = ""
    @State private var showProgress = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Toast
                if showErrorToast {
                    Tost(message: errorMessage, backgroundColor: Color.blue)
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
                
                if showProgress {
                    ProgressView()
                }
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Login") {
                    viewModel.logIn()
                }
                .padding()
                
                
                if(navigateToQuizView){
                    NavigationLink(destination: ProviderView(), isActive: $navigateToQuizView ,label: {
                        EmptyView()
                    })
                }
                
                
                NavigationLink(destination: SignupView()) {
                    Text("Signup")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
            }.navigationTitle("Login")
                .padding()
                .onChange(of: viewModel.loginState) { state in
                    switch(state) {
                    case .idle:
                        showErrorToast = false
                        showProgress = false
                    case .loading:
                        showProgress = true
                        showErrorToast = false
                    case .success:
                        showProgress = false
                        navigateToQuizView = true
                    case .failure(let errorMessage):
                        showProgress = false
                        self.errorMessage = errorMessage
                        showErrorToast = true
                    }
            }
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    LoginView()
}
