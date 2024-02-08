//
//  ScoreListItem.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 07/02/2024.
//

import Foundation

struct ScoreListItem: Identifiable {
    let id: String
    let point:Int
    let email:String
    
    init(id:String, point: Int, email: String) {
        self.id = id
        self.point = point
        self.email = email
    }
}
