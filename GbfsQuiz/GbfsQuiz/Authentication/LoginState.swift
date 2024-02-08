//
//  LoginState.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 07/02/2024.
//

import Foundation
enum LoginState:Equatable {
    case idle
    case loading
    case success
    case failure(_ message: String)
}
