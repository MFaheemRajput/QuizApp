//
//  LeaderBoard.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 07/02/2024.
//

import SwiftUI

struct LeaderBoardView: View {
    @ObservedObject var viewModel = LeaderBoardViewVM()
    var body: some View {
        NavigationView {
            VStack{
                List(viewModel.scoreboardItems) { item in
                    VStack(alignment: .leading) {
                        Text("Player: \(item.email)")
                        Text("Score: \(item.point)")
                    }
                }
                
            }.onAppear {
                
                Task {
                    await viewModel.fetchAllData(scoreBoard)
                }
                
            }
        }
        .navigationBarTitle("Scoreboard", displayMode: .inline)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LeaderBoardView()
}
