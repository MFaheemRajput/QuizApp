//
//  ProviderModel.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 04/02/2024.
//

import Foundation

struct Provider: Identifiable, Hashable {
    var id: UUID
    var countryCode: String
    var name: String
    var location: String
    var systemID: String
    var url: String
    var autoDiscoveryURL: String
    var authenticationInfo: String

    init(countryCode: String, name: String, location: String, systemID: String, url: String, autoDiscoveryURL: String, authenticationInfo: String) {
        self.id = UUID()
        self.countryCode = countryCode
        self.name = name
        self.location = location
        self.systemID = systemID
        self.url = url
        self.autoDiscoveryURL = autoDiscoveryURL
        self.authenticationInfo = authenticationInfo
    }
    
}
