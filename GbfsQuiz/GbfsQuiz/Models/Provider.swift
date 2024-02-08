//
//  ProviderModel.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import Foundation

struct Provider {
    var countryCode: String
    var name: String
    var location: String
    var systemID: String
    var url: URL
    var autoDiscoveryURL: URL?
    var authenticationInfo: String?

    init(countryCode: String, name: String, location: String, systemID: String, url: URL, autoDiscoveryURL: URL? = nil, authenticationInfo: String? = nil) {
        
        self.countryCode = countryCode
        self.name = name
        self.location = location
        self.systemID = systemID
        self.url = url
        self.autoDiscoveryURL = autoDiscoveryURL
        self.authenticationInfo = authenticationInfo
        
    
    }
    
}
