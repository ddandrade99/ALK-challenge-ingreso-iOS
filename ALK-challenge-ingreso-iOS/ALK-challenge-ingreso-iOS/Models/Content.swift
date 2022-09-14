//
//  Content.swift
//  ALK-challenge-ingreso-iOS
//
//  Created by Daniel De Andrade Souza on 14/09/22.
//

import Foundation

struct Content: Codable {
    var content: [HighlightItem]
}

struct HighlightItem: Codable {
    let id: String
    let position: Int
    let type: String
}
