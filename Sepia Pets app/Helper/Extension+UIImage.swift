//
//  Extension+UIImage.swift
//  Sepia Pets app
//
//  Created by Vishal Kamble on 18/02/23.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        DispatchQueue.global(qos: .background).async  { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    if let loadedImage = UIImage(data: imageData) {
                            self?.image = loadedImage
                    }
                }
               
            }
        }
    }
}
