//
//  EmployeeLoginController.swift
//  SkiClock
//
//  Created by Ian Sime on 4/13/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

class EmployeeLoginController: UIViewController {
    var store_id: String = "1"
    var realID = false
    let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    @IBOutlet weak var ErroLabel: UILabel!
    @IBOutlet weak var StoreIDBox: UITextField!
    @IBAction func LoginButtonPress(_ sender: Any) {
        getStoreID()
        if realID{
            ErroLabel.textColor = UIColor.white
            self.performSegue(withIdentifier: "employeeLoginToEmployeeHome", sender: self)
        }
        else{
            setError()
        }
    }
    
    func setError(){
        ErroLabel.text = "Invalid Store ID"
        ErroLabel.textColor = UIColor.red
    }
    
    func getStoreID(){
        realID = false
        store_id = StoreIDBox.text ?? "1"
        checkStoreID()
    }
    
    func checkStoreID(){
        if Set(store_id).isSubset(of: nums){
            realID = true
        }
        if store_id == ""{
            realID = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "employeeLoginToEmployeeHome"{
            let nextScene = segue.destination as? ViewController
            nextScene!.store_id = Int(store_id)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StoreIDBox.keyboardType = .numberPad

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
