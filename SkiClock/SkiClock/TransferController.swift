//
//  TransferController.swift
//  SkiClock
//
//  Created by Ian Sime on 5/1/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

class TransferController: UIViewController {
    var store_id: Int!
    var asset_id: String = "0"
    var realID = false
    let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var assestIDBox: UITextField!
    @IBAction func SubmitTransferSearchButtonPress(_ sender: Any) {
        getAssetID()
        if realID{
            self.performSegue(withIdentifier: "transferSearchToTransferCheckIn", sender: self)
        }
        else{
            setError()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "trnasferSearchToEquipment"{
            let nextScene = segue.destination as? EquipmentHomeController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "transferSearchToEmployeeDash"{
            let nextScene = segue.destination as? ViewController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "transferSearchToTransferCheckIn"{
            let nextScene = segue.destination as? TransferCheckInController
            nextScene!.store_id = store_id
            nextScene!.asset_id = Int(asset_id)
        }
    }
    
    func getAssetID(){
        realID = false
        asset_id = assestIDBox.text ?? "0"
        checkAssetID()
    }
    
    func checkAssetID(){
        if Set(asset_id).isSubset(of: nums){
            if asset_id.count == 6{
            realID = true
            }
        }
        if asset_id == ""{
            realID = false
        }
    }
    
    func setError(){
        ErrorLabel.text = "Invalid Asset ID"
        ErrorLabel.textColor = UIColor.red
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        assestIDBox.keyboardType = .numberPad

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
