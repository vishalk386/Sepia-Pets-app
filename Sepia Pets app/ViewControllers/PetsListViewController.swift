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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension PetsListViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected IndexPath \(indexPath)")
    }
}
