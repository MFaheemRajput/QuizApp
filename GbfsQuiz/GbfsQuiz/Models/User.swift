//
//  User.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import Foundation
import SwiftUI

class User:NSObject {
    
    var userId: String?
    var email: String?
    var token: String?
    var totalPointForAllTime: Int?
    var lastQuizPoints: Int?
    @State var isLogin:Bool = false
    //var allTimeQuizResultArray[]
    
    static let currentUser = User()
    
    func update(userId: String? = nil, email: String? = nil, token: String? = nil, totalPointForAllTime: Int? = nil, lastQuizPoints: Int? = nil, isLogin: Bool) {
        self.userId = userId
        self.email = email
        self.token = token
        self.totalPointForAllTime = totalPointForAllTime
        self.lastQuizPoints = lastQuizPoints
        self.isLogin = isLogin
    }
    
    private func logout() {
        
    }
}
