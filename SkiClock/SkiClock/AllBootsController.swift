//
//  AllBootsController.swift
//  SkiClock
//
//  Created by Ian Sime on 3/17/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

class AllBootsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var store_id: Int!
    var boots = [Boot]()
    var id = [Int]()
    var sole_length = [Int]()
    var size = [Float]()
    var manufacturer = [String]()
    var model = [String]()
    
    @IBOutlet weak var AllBootsTable: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "allBootsToBootsIn"{
            let nextScene = segue.destination as? BootsInController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "allBootsToEquipmentHome"{
            let nextScene = segue.destination as? EquipmentHomeController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "allBootsToEmployeeDash"{
            let nextScene = segue.destination as? ViewController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "allBootsToBootsOut"{
            let nextScene = segue.destination as? BootsOutController
            nextScene!.store_id = store_id
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allBootsCell = tableView.dequeueReusableCell(withIdentifier: "allBootsCell"/*Identifier*/, for: indexPath as IndexPath)
        
        let cellText = String(self.size[indexPath.row]) + " | " + self.manufacturer[indexPath.row] + " | " + self.model[indexPath.row] + " | " +  String(self.sole_length[indexPath.row]) + " | " + String(self.id[indexPath.row])
        
        allBootsCell.textLabel?.text = cellText
        allBootsCell.textLabel?.textAlignment = .center
        
        return allBootsCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boots.count
    }
    
    func getEquipment(){
        let equipmentUrl = "http://10.0.0.7:5000/all_boots/" + String(store_id)
        guard let url = URL(string: equipmentUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                self.boots = try JSONDecoder().decode([Boot].self, from: data)
                //                print(skis)
                for info in self.boots {
                    self.id.append(info.boot_id ?? 0)
                    self.sole_length.append(info.sole_length ?? 0)
                    self.size.append(info.size ?? 0)
                    self.manufacturer.append(info.manufacturer ?? "N/A")
                    self.model.append(info.model ?? "N/A")
                    
                    DispatchQueue.main.async {
                        self.AllBootsTable.reloadData()
                    }
                    
                }
                
                //                print(self.boots)
            } catch let jsonErr {
                
            }
            }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEquipment()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
