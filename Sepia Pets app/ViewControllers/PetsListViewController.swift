//
//  PetsListViewController.swift
//  Sepia Pets app
//
//  Created by Vishal Kamble on 18/02/23.
//

import UIKit

class PetsListViewController: UIViewController {
    
    @IBOutlet weak var _tableView: UITableView!
    var petsData = [Pet]()
    let loader = DataLoader()
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader = DataLoader()
        guard let data = loader.parseJSON() else { return }
        petsData = data
        _tableView.reloadData()
        // Do any additional setup after loading the view.
    }
}

extension PetsListViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetsTableViewCell", for: indexPath) as! PetsTableViewCell
                   cell.setData(model: petsData[indexPath.row])

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "PetsDetailsViewController") as? PetsDetailsViewController{
            vc.petData = petsData[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
