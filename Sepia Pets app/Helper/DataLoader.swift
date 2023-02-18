//
//  DataLoader.swift
//  Sepia Pets app
//
//  Created by Vishal Kamble on 18/02/23.
//

import Foundation

public class DataLoader {
    
    func parseJSON() -> [Pet]? {
        guard let url = Bundle.main.url(forResource: "pets_list", withExtension: "json") else {
            print("\n-------> bundle path error")
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(PetsData.self, from: jsonData)
            print("\n-------> response: \(response)")
            return response.pets
        }
        catch {
            print("\n====> error: \(error)" )
            return nil
        }
        
    }
}
