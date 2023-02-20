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
    var workHrData : Settings?
    var startDay = Int()
    var currentDay = Int()
    var endDay = Int()
    var workHoursString = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        // Do any additional setup after loading the view.
    }
    
    func setupData(){
        guard let data = loader.parseJSON() else { return }
        guard let data1 = loader.parseConfigData() else { return }
        workHrData = data1
        petsData = data
        _tableView.reloadData()
    }
    //MARK: - As per response not considering Thursday & Sunday
    func getDay(day: String) -> Int {
        switch day {
        case "M":
            return 0
            
        case "T":
            return 1
            
        case "W":
            return 2

        case "F":
            return 4
            
        case "S":
            return 5
        case "Mon":
            return 0
            
        case "Tue":
            return 1
            
        case "Wed":
            return 2
            
        case "Thu":
            return 3
            
        case "Fri":
            return 4
            
        case "Sat":
            return 5
            
        case "Sun":
            return 6
        default :
            return 0
            
            
        }
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
        
        workHoursString = (workHrData?.workHours)!
        let separatorIndex = workHoursString.firstIndex(of: " ")
        let startString = workHoursString.prefix(upTo: separatorIndex!).trimmingCharacters(in: .whitespacesAndNewlines)
        let endString = workHoursString.suffix(from: separatorIndex!).trimmingCharacters(in: .whitespacesAndNewlines)
        let startString1 = startString.components(separatedBy: "-")[0]
        let endString1 = startString.components(separatedBy: "-")[1]
        let startTime = endString.components(separatedBy: " - ")[0]
        let endTime = endString.components(separatedBy: " - ")[1]
        let startDate = Date().string(format: "E")
        
        startDay = getDay(day: startString1)
        
        endDay = getDay(day: endString1)
        
        currentDay = getDay(day: startDate)
        
        if currentDay >= startDay && currentDay <= endDay{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let currentTime = dateFormatter.string(from: Date())
            
            if currentTime >= startTime && currentTime <= endTime {
                
                if let vc = storyboard?.instantiateViewController(identifier: "PetsDetailsViewController") as? PetsDetailsViewController{
                    vc.petData = petsData[indexPath.row]
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                let alertController = UIAlertController(title: "Not available", message: "The application is only available during working hours.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
            
        }
        else{
            let alertController = UIAlertController(title: "Not available", message: "The application is only available during working hours2132.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}

