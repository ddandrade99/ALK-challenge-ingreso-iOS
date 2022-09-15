//
//  MultigetResponse.swift
//  ALK-challenge-ingreso-iOS
//
//  Created by Daniel De Andrade Souza on 14/09/22.
//

import Foundation

struct MultiGetResponse: Codable {
    let code: Int
    let body: ItemFromCategory
}

struct ItemFromCategory: Codable {
    let id: String
    let pictures: [ResultPicture]
    let title: String
    let subtitle: String?
    let price: Double
    let secureThumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case pictures
        case title
        case subtitle
        case price
        case secureThumbnail = "secure_thumbnail"
    }
}

struct ResultPicture: Codable {
    let secureUrl: String
    
    enum CodingKeys: String, CodingKey {
        case secureUrl = "secure_url"
    }
}
