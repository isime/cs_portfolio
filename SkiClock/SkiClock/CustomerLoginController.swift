//
//  CustomerLoginController.swift
//  SkiClock
//
//  Created by Ian Sime on 4/15/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

class CustomerLoginController: UIViewController {
    var customer_id: String = "1"
    var realID = false
    let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    @IBOutlet weak var customerIDEntery: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBAction func LoginButtonPress(_ sender: Any) {
        getCustomerID()
        if realID{
            ErrorLabel.textColor = UIColor.white
        self.performSegue(withIdentifier: "customerLoginToCustomerHome", sender: self)
        }
        else{
            ErrorLabel.textColor = UIColor.red
        }
    }
    
    func setError(){
        ErrorLabel.text = "Invalid Customer ID"
        ErrorLabel.textColor = UIColor.white
    }
    
    func getCustomerID(){
        realID = false
        customer_id = customerIDEntery.text ?? "1"
        checkCustomerID()
    }
    
    func checkCustomerID(){
        if Set(customer_id).isSubset(of: nums){
            realID = true
        }
        if customer_id == ""{
            realID = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "customerLoginToCustomerHome"{
            let nextScene = segue.destination as? CustomerHomeController
            nextScene!.customer_id = Int(customer_id)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customerIDEntery.keyboardType = .numberPad
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
