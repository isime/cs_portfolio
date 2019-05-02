//
//  TransferCheckInController.swift
//  SkiClock
//
//  Created by Ian Sime on 5/1/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

struct TransferInfo: Decodable {
    let equipment: String?
    let ski_id: Int?
    let length: Int?
    let manufacturer: String?
    let model: String?
    let boot_id: Int?
    let boot_size: Float?
    let sole_length: Int?
    let helmet_id: Int?
    let color: String?
    let helmet_size: String?
    let original_store: Int?
    let current_store: Int?
}

class TransferCheckInController: UIViewController {
    var asset_id: Int!
    var store_id: Int!
    var equipment_type: String = "None"
    var id: Int = 0
    var length: Int = 0
    var manufacture: String = "N/A"
    var model: String = "N/A"
    var color: String = "N/A"
    var helmet_size: String  = "N/A"
    var boot_size: Float = 1.0
    var original_store: Int = 0
    var transfered: String = "false"
    var current_store: Int = 0
    var realID: Bool = true
    
    
    @IBOutlet weak var EquipmentLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Label6: UILabel!
    @IBOutlet weak var RecievedButton: UIButton!
    
    @IBAction func RecievedButtonPress(_ sender: Any) {
        if store_id != current_store && realID{
        setRecieved()
        }
    }
    
    @IBAction func EquipmentHomeButtonPress(_ sender: Any) {
        if realID{
        sendTransfered()
        }
    }
    @IBAction func HomeButtonPress(_ sender: Any) {
        if realID{
        sendTransfered()
        }
    }
    @IBAction func TransferSearchButtonPress(_ sender: Any) {
        if realID{
        sendTransfered()
        }
    }
    
    
    
    func checkCurrentStore(){
        if store_id == current_store{
            RecievedButton.setTitle("Already Recieved", for: .normal)
            if current_store == original_store{
            RecievedButton.backgroundColor = UIColor.green
            RecievedButton.setTitleColor(UIColor.black, for: .normal)
            }
            else{
                RecievedButton.backgroundColor = UIColor.blue
            }
        }
    }
    
    func setRecieved(){
        if RecievedButton.currentTitle == equipment_type{
            transfered = "true"
            RecievedButton.setTitle("Recieved", for: .normal)
            if store_id == original_store{
                RecievedButton.backgroundColor = UIColor.green
            RecievedButton.setTitleColor(UIColor.black, for: .normal)
            }
            else{
                RecievedButton.backgroundColor = UIColor.blue
            }
        }
        else if RecievedButton.currentTitle == "Recieved"{
            transfered = "false"
        RecievedButton.setTitle(equipment_type, for: .normal)
        RecievedButton.backgroundColor = UIColor.black
     RecievedButton.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    
    func getTransferInfo(){
        let transferUrl = "http://10.0.0.7:5000/get_transfer/" + String(asset_id)
        
        guard let url = URL(string: transferUrl)
            else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let transferData = try JSONDecoder().decode(TransferInfo.self, from: data)
                
                if transferData.equipment == "Skis"{
                    self.equipment_type = transferData.equipment ?? "N/A"
                    self.id = transferData.ski_id ?? 0
                    self.length = transferData.length ?? 0
                    self.model = transferData.model ?? "N/A"
                    self.manufacture = transferData.manufacturer ?? "N/A"
                    self.original_store = transferData.original_store ?? 0
                    self.current_store = transferData.current_store ?? 0
                }
                else if transferData.equipment == "Boots"{
                    self.equipment_type = transferData.equipment ?? "N/A"
                    self.id = transferData.boot_id ?? 0
                    self.boot_size = transferData.boot_size ?? 1.0
                    self.length = transferData.sole_length ?? 0
                    self.model = transferData.model ?? "N/A"
                    self.manufacture = transferData.manufacturer ?? "N/A"
                    self.original_store = transferData.original_store ?? 0
                    self.current_store = transferData.current_store ?? 0
                }
                else if transferData.equipment == "Helmet"{
                    self.equipment_type = transferData.equipment ?? "N/A"
                    self.id = transferData.helmet_id ?? 0
                    self.color = transferData.color ?? "N/A"
                    self.helmet_size = transferData.helmet_size ?? "N/A"
                    self.original_store = transferData.original_store ?? 0
                    self.current_store = transferData.current_store ?? 0
                }
                else if transferData.equipment == "No Asset With"{
                    self.equipment_type = transferData.equipment ?? "N/A"
                }
                
                DispatchQueue.main.async {
                    self.initialText()
                    self.checkCurrentStore()
                }
            } catch let jsonErr { }
        }.resume()
    }
    
    func sendTransfered(){
        let transferJson: [String: String] = ["asset_id": String(id), "transfered": transfered, "equipment": equipment_type, "store_id": String(store_id)]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: transferJson)
        
        let url = URL(string: "http://10.0.0.7:5000/transfer_complete")
        var request = URLRequest(url: url!)
        request.httpMethod = "Post"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in guard let data = data, error == nil else {print(error?.localizedDescription ?? "No Data"); return}
            let reponseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = reponseJSON as? [String: Any] {
                print(reponseJSON)
            }
        }
        task.resume()
    }
    
    func initialText(){
        if id == 0{
            id = asset_id
        }
        EquipmentLabel.text = equipment_type
        IDLabel.text = "ID: " + String(id)
        RecievedButton.setTitle(equipment_type, for: .normal)
        if equipment_type == "Skis" || equipment_type == "Boots"{
            Label3.text = "Model: " + model
            Label4.text = "Manufacturer: " + manufacture
            if equipment_type == "Skis"{
                Label5.text = "Length: " + String(length)
            }
            else if equipment_type == "Boots"{
                Label5.text = "Size: " + String(boot_size)
                Label6.text = "Sole Length: " + String(length)
            }
        }
        else if equipment_type == "Helmet"{
            Label3.text = "Size: " + helmet_size
            Label4.text = "Color: " + color
        }
        else if equipment_type == "None" || equipment_type == "No Asset With"{
            EquipmentLabel.textColor = UIColor.red
            IDLabel.textColor = UIColor.red
            realID = false
            RecievedButton.setTitle("No Asset", for: .normal)
            RecievedButton.backgroundColor = UIColor.red
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "transferCheckInTOEquipmentHome"{
            let nextScene = segue.destination as? EquipmentHomeController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "transferCheckInTOTransferSearch"{
            let nextScene = segue.destination as? TransferController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "transferCheckInToEmployeeDash"{
            let nextScene = segue.destination as? ViewController
            nextScene!.store_id = store_id
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getTransferInfo()

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
