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
    var selectedProvider:Provider?
    var providerDetail:ProviderDetail?
    
    //Initializer access level change now
    private override init(){
        self.providers = [Provider]()
    }
    
    func readCSVFromFile() {
        
        if let csvFileURL = Bundle.main.path(forResource: providersFileName, ofType: "csv") {
            do {
                let csv: CSV = try CSV<Named>(url: URL(fileURLWithPath: csvFileURL))
                self.providers.removeAll()
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
                        url: url,
                        autoDiscoveryURL: adu,
                        authenticationInfo: authInfo
                    )
                    self.providers.append(providerModel)
                }
            } catch {
                print("Error reading CSV file: \(error)")
            }
        }
    }
    
    func fetchGbfsdata(_ urlString: String, completion: @escaping (ProviderDetail?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("HTTP Error: \(response?.description ?? "Unknown")")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                do {
                    print(response)
                    let decoder = JSONDecoder()
                    let response: ProviderDetail = try decoder.decode(ProviderDetail.self, from: responseString.data(using: .utf8)!)
                    DispatchQueue.main.async {
                        completion(response)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            }
        }.resume()
    }

    
}
