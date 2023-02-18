//
//  PetsData.swift
//  Sepia Pets app
//
//  Created by Vishal Kamble on 18/02/23.
//

import Foundation

// MARK: - PetsData
struct PetsData: Decodable {
    let pets: [Pet]
}

// MARK: - Pet
struct Pet: Decodable {
    let imageURL: String
    let title: String
    let contentURL: String
    let dateAdded: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case title
        case contentURL = "content_url"
        case dateAdded = "date_added"
    }
}
