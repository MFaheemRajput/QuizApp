//
//  GbfsQuizApp.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct GbfsQuizApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    init() {
            ProviderLoader.shared.readCSVFromFile()
        }

    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser?.uid == nil {
                LoginView()
            } else {
                QuizController()
            }

        }
    }
}
