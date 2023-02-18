//
//  PetsTableViewCell.swift
//  Sepia Pets app
//
//  Created by Vishal Kamble on 18/02/23.
//

import UIKit

class PetsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPet: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setData(model : Pet?){
        self.lblName.text = model?.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: model?.dateAdded ?? "2018-08-04T10:45:29.027Z")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.lblDate.text = dateFormatter.string(from: date!)
        imgPet.loadFrom(URLAddress: model!.imageURL)
    }
}
