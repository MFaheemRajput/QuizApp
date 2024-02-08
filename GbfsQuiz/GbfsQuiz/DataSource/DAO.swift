//
//  DAO.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 06/02/2024.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class DAO {
    let db = Firestore.firestore()
    static let shared = DAO()
    
    private init() {
        
    }
    
    func addData (quiz:Quiz, collectionName:String) async{
        // Add a new document with a generated ID
        do {
            if let userId = Auth.auth().currentUser?.uid {
                let ref = try await db.collection(collectionName).addDocument(data: [userId:quiz.dictionaryRepresentation()])
               //let ref = try await db.collection(collectionName).document("userId").setData(["date":quiz])
                print("Document added with ID: \(ref.documentID)")
            }
        } catch {
          print("Error adding document: \(error)")
        }
    }
    
    func fetchDataFromColection(_ name:String) async -> [[String: Any]] {
        
        var result:[[String: Any]]  = []
        
        do {
          let snapshot = try await db.collection(name).getDocuments()
            for document in snapshot.documents {
                var documentData = document.data()
                    documentData["documentID"] = document.documentID
                result.append(documentData)
            }
        } catch {
            print("Error getting documents: \(error)")
        }
        return result
    }
}
