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
}

struct ResultPicture: Codable {
    let secure_url: String
}
