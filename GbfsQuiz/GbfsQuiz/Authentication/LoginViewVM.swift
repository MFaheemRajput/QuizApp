//
//  LoginView.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import Foundation
import SwiftUI
import Firebase

class LoginViewVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published private(set) var loginState:LoginState = .idle
    
    func logIn() {
        loginState = .loading
        if(email.removingLeadingTrailingWhitespace().isEmpty){
            
            loginState = .failure(emptyEmail)
            return
        }
        
        if(password.removingLeadingTrailingWhitespace().isEmpty){
            
            loginState = .failure(emptyPassword)
            return
        }
        
        if(!email.isValidEmail()){
            
            loginState = .failure(worngEmailFormat)
            return
        }
                
        Auth.auth().signIn(withEmail: email, password: password) { [self]  authResult, error in
                if let error = error {
                    print("Error logging in: \(error.localizedDescription)")
                    loginState = .failure(error.localizedDescription)
                } else {
                    print("User logged in successfully!")
                    User.currentUser.isLogin = true
                    User.currentUser.email = self.email
                    // You can navigate to the next screen or perform additional actions here.
                    loginState = .success
                }
            }
        }
}
