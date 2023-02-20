//
//  ConfigData.swift
//  Sepia Pets app
//
//  Created by Vishal Kamble on 18/02/23.
//

import Foundation


import Foundation

// MARK: - ConfigData
struct ConfigData : Decodable {
    let settings: Settings
}

// MARK: - Settings
struct Settings : Decodable {
    let workHours: String?
}
