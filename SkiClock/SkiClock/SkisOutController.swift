//
//  SkisOutController.swift
//  SkiClock
//
//  Created by Ian Sime on 3/15/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

class SkisOutController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var store_id: Int!
    var skis = [Ski]()
    var id = [Int]()
    var length = [Int]()
    var manufacturer = [String]()
    var model = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skis.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let skiCell = tableView.dequeueReusableCell(withIdentifier: "skisOutCell", for: indexPath)
        
        let cellText = String(self.length[indexPath.row]) + " | " + self.manufacturer[indexPath.row] + " | " + self.model[indexPath.row] + " | " + String(self.id[indexPath.row])
        
        skiCell.textLabel?.text = cellText
        skiCell.textLabel?.textAlignment = .center
        return skiCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "skisOutToAllSkis"{
            let nextScene = segue.destination as? AllSkisListController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "skisOutToSkisIn"{
            let nextScene = segue.destination as? EquipmentListController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "skisOutToEquipmentHome"{
            let nextScene = segue.destination as? EquipmentHomeController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "skisOutToEmployeeDash"{
            let nextScene = segue.destination as? ViewController
            nextScene!.store_id = store_id
        }
    }
    
    func getEquipment(){
        let equipmentUrl = "http://10.0.0.7:5000/currently_out_skis/" + String(store_id)
        guard let url = URL(string: equipmentUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                self.skis = try JSONDecoder().decode([Ski].self, from: data)
                //                print(skis)
                for info in self.skis {
                    self.id.append(info.ski_id ?? 0)
                    self.length.append(info.length ?? 0)
                    self.manufacturer.append(info.manufacturer ?? "N/A")
                    self.model.append(info.model ?? "N/A")
                    
                    DispatchQueue.main.async {
                        self.SkisOutTable.reloadData()
                    }
                    
                }
                //                print(self.id)
                //                print("BREAK HERE")
                //                print(self.skis)
            } catch let jsonErr {
                
            }
            }.resume()
    }

    @IBOutlet weak var SkisOutTable: UITableView!
    
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
