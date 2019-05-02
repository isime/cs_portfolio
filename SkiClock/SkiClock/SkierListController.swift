//
//  SkierListController.swift
//  SkiClock
//
//  Created by Ian Sime on 3/17/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

struct SkierInfo: Decodable {
    let last_name: String?
    let first_name: String?
    let skier_id: Int?
    let height: Int?
    let age: Int?
    let weight: Int?
    let skier_type: Int?
}

class SkierListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var skiers = [SkierInfo]()
    var skier_id = [Int]()
    var first_name = [String]()
    var last_name = [String]()
    var height = [Int]()
    var age = [Int]()
    var weight = [Int]()
    var skier_type = [Int]()
    var rental_id: Int!
    var customer_id: Int!
    var store_id: Int!

    @IBOutlet weak var SkiersTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skiers.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let skierCell = tableView.dequeueReusableCell(withIdentifier: "skierCell", for: indexPath)
        
        let cellText =  self.first_name[indexPath.row] + " " + self.last_name[indexPath.row]
        
        skierCell.textLabel?.text = cellText
        skierCell.textLabel?.textAlignment = .center
        return skierCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SkierListToEquipmentForm", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SkierListToEquipmentForm"{
            let nextScene = segue.destination as? SkierEquipmentFormContoller
            let indexPath = self.SkiersTable.indexPathForSelectedRow
            
            let firstName = first_name[indexPath!.row]
            let lastName = last_name[indexPath!.row]
            let Age = age[indexPath!.row]
            let Height = height[indexPath!.row]
            let Weight = weight[indexPath!.row]
            let skierType = skier_type[indexPath!.row]
            let skierID = skier_id[indexPath!.row]
            let rentalID = rental_id
            let customerID = customer_id
            
            nextScene!.first_name = firstName
            nextScene!.last_name = lastName
            nextScene!.age = Age
            nextScene!.height = Height
            nextScene!.weight = Weight
            nextScene!.skier_type = skierType
            nextScene!.skier_id = skierID
            nextScene!.rental_id = rentalID
            nextScene!.customer_id = customerID
            nextScene!.store_id = store_id
        }
        if segue.identifier == "skierListToTomorrowsPickUps"{
            let nextScene = segue.destination as? TomorrowsPickUpsController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "skierListToRentalsHome"{
            let nextScene = segue.destination as? RentalHomeController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "skierListToEmployeeDash"{
            let nextScene = segue.destination as? ViewController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "skierListToTodaysPickUps"{
            let nextScene = segue.destination as? RentalsListController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "skierListToOverduePickUps"{
            let nextScene = segue.destination as? OverduePickUpsController
            nextScene!.store_id = store_id
        }
    }
    
    
    func getSkiers(){
        let rentalsUrl = "http://10.0.0.7:5000/skiers/" + String(rental_id)
        guard let url = URL(string: rentalsUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                self.skiers = try JSONDecoder().decode([SkierInfo].self, from: data)
                //                print(skis)
                for info in self.skiers {
                    self.skier_id.append(info.skier_id ?? 0)
                    self.last_name.append(info.last_name ?? "N/A")
                    self.first_name.append(info.first_name ?? "N/A")
                     self.age.append(info.age ?? 0)
                     self.height.append(info.height ?? 0)
                     self.weight.append(info.weight ?? 0)
                     self.skier_type.append(info.skier_type ?? 0)
                    
                    DispatchQueue.main.async {
                        self.SkiersTable.reloadData()
                    }
                    
                }
                //                print(self.id)
                //                print("BREAK HERE")
//                print(self.skiers)
            } catch let jsonErr {
                
            }
            }.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSkiers()

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
