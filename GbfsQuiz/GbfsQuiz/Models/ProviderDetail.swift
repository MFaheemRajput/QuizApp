//
//  ProviderDetail.swift
//  GbfsQuiz
//
//  Created by Muhammad Faheem Khan on 08/02/2024.
//

import Foundation
struct ProviderDetail:Codable {
    let lastUpdated: Int?
    let ttl: Int?
    let data: DataResponse
    let version: String?
    
    struct DataResponse: Codable {
        let en: EnResponse
        
        struct EnResponse: Codable {
            let feeds: [Feed]
            
            struct Feed: Codable {
                let name: String
                let url: String
            }
        }
    }
    
    // Conforming to NSObject for string interpolation
        func appendInterpolation(_ value: Any?) {
            appendInterpolation(NSString(format: "%@", String(describing: value)))
        }
}

//// Example usage:
//let json = """
//{
//    "last_updated": 1707382439,
//    "ttl": 9,
//    "data": {
//        "en": {
//            "feeds": [
//                {"name": "system_regions", "url": "https://dubai.publicbikesystem.net/customer/gbfs/v2/en/system_regions"},
//                {"name": "system_information", "url": "https://dubai.publicbikesystem.net/customer/gbfs/v2/en/system_information"},
//                {"name": "system_pricing_plans", "url": "https://dubai.publicbikesystem.net/customer/gbfs/v2/en/system_pricing_plans"},
//                {"name": "gbfs_versions", "url": "https://dubai.publicbikesystem.net/customer/gbfs/v2/gbfs_versions"},
//                {"name": "vehicle_types", "url": "https://dubai.publicbikesystem.net/customer/gbfs/v2/en/vehicle_types"},
//                {"name": "station_information", "url": "https://dubai.publicbikesystem.net/customer/gbfs/v2/en/station_information"},
//                {"name": "station_status", "url": "https://dubai.publicbikesystem.net/customer/gbfs/v2/en/station_status"}
//            ]
//        }
//    },
//    "version": "2.3"
//}
//""".data(using: .utf8)!
//
//do {
//    let decoder = JSONDecoder()
//    let response = try decoder.decode(ProviderDetail.self, from: json)
//    print(response)
//} catch {
//    print("Error decoding JSON: \(error)")
//}
