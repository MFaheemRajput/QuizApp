//
//  ResultView.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 06/02/2024.
//

import SwiftUI

struct ResultView: View {
    let points: Int

    var body: some View {
        VStack {
            if points > 0 {
                WinAnimationView()
                Text("Congrats you won!")
                    .font(.title)
                    .padding()
            } else {
                LoseAnimationView()
                Text("Ops batter luck next time")
                    .font(.title)
                    .padding()
            }
            
            Text("Points: \(points)")
                .font(.title)
                .padding()
        }
    }
}

struct WinAnimationView: View {
    var body: some View {
        Image(systemName: "sparkles")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(.green)
            .padding()
            .animation(.easeInOut)
    }
}

struct LoseAnimationView: View {
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
            .padding()
            .animation(.easeInOut)
    }
}
