//
//  ViewController.swift
//  SkiClock
//
//  Created by Ian Sime on 12/2/18.
//  Copyright © 2018 Ian Sime. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var store_id: Int!

    @IBAction func EquipmentListButtonPress(_ sender: Any) {
        performSegue(withIdentifier: "employeeDashboardToEquipmentHome", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "employeeDashboardToEquipmentHome"{
            let nextScene = segue.destination as? EquipmentHomeController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "employeeDashToNewCustomer"{
            let nextScene = segue.destination as? NewCustomerController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "employeeDashToRentalsHome"{
            let nextScene = segue.destination as? RentalHomeController
            nextScene!.store_id = store_id
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

