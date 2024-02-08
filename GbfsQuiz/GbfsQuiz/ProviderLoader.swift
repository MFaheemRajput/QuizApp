//
//  SystemModelBuilder.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import Foundation
import SwiftCSV

class ProviderLoader : NSObject{
    
    static let shared = ProviderLoader()
    var providers:[Provider]
    
    //Initializer access level change now
    private override init(){
        self.providers = [Provider]()
    }
    
    func readCSVFromFile() {
        
        if let csvFileURL = Bundle.main.path(forResource: providersFileName, ofType: "csv") {
            do {
                
                let csv: CSV = try CSV<Named>(url: URL(fileURLWithPath: csvFileURL))
            
                for row in csv.rows {
                    guard let cc = row["Country Code"] else {
                        return
                    }
                    guard let name = row["Name"]else{
                        return
                    }
                    guard let location = row["Location"]else{
                        return
                    }
                    guard let sysId = row["System ID"]else{
                        return
                    }
                    guard let url = row["URL"]else{
                        return
                    }
                    guard let adu = row["Auto-Discovery URL"]else{
                        return
                    }
                    guard let authInfo = row["Authentication Info"]else{
                        return
                    }
                    
                    let providerModel = Provider(
                            countryCode: cc,
                            name: name,
                            location: location,
                            systemID: sysId,
                            url: URL.init(fileURLWithPath: url))
                        
                    providers.append(providerModel)
                }
            } catch {
                print("Error reading CSV file: \(error)")
            }
        }
    }
}
