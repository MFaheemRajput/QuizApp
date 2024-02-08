//
//  LeaderBoardViewVM.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 07/02/2024.
//

import Foundation
import FirebaseAuth

class LeaderBoardViewVM:ObservableObject {
    
    @Published var scoreboardItems: [ScoreListItem] = []
    
    //NOTE: Pagination will be implemented if i have more time
    func fetchAllData(_ collectionName:String) {
        Task {
            let results = await DAO.shared.fetchDataFromColection(collectionName)
            await MainActor.run {
                self.scoreboardItems = results.compactMap { dataSnap in
                    guard let id = dataSnap["documentID"] as? String,
                          let data = dataSnap[Auth.auth().currentUser!.uid] as? [String:Any],
                          let email = data["userEmail"] as? String,
                          let score = data["points"] as? Int else {
                        return nil
                    }
                    
                    return ScoreListItem(id: id, point: score, email: email)
                }
            }
        }
    }
}
