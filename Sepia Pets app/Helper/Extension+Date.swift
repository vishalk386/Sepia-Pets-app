//
//  Extension+Date.swift
//  Sepia Pets app
//
//  Created by Vishal Kamble on 20/02/23.
//

import Foundation

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
