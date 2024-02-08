//
//  Tost.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 06/02/2024.
//

import SwiftUI

struct Tost: View {
    let message: String
    let backgroundColor: Color
    var body: some View {
        HStack {
            Spacer()
            Text(message)
                .foregroundColor(.white)
                .padding()
                .background(backgroundColor)
                .cornerRadius(8)
                
        }
    }
}

#Preview {
    Tost(message: "from preview", backgroundColor: .blue)
}

