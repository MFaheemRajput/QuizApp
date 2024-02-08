//
//  ProviderState.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 06/02/2024.
//

import Foundation
enum ProviderState:Equatable {
    case idle
    case loading
    case success
    case failure(_ message: String)
}
