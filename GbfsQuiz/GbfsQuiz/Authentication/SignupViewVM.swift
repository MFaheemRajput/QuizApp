//
//  SignupView.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import SwiftUI
import Firebase

class SignupViewVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSignup: Bool = false
    @Published var errorMessage: String = ""

    func signUp() {
        if(email.removingLeadingTrailingWhitespace().isEmpty){
            self.errorMessage = emptyEmail
            return
        }
        
        if(password.removingLeadingTrailingWhitespace().isEmpty){
            self.errorMessage = emptyPassword
            return
        }
        
        if(!email.isValidEmail()){
            self.errorMessage = worngEmailFormat
            return
        }
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print("Error signing up: \(error.localizedDescription)")
                } else {
                    print("User signed up successfully!")
                    self.isSignup = true
                    User.currentUser.isLogin = self.isSignup
                    User.currentUser.email = self.email
            }
        }
    }
}
