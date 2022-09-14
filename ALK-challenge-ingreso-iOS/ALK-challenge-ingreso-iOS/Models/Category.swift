//
//  CategoryModel.swift
//  ALK-challenge-ingreso-iOS
//
//  Created by Daniel De Andrade Souza on 13/09/22.
//

import Foundation

struct Category: Codable {
    let categoryID: String
    
    enum CodingKeys: String, CodingKey {
           case categoryID = "category_id"
       }
}
