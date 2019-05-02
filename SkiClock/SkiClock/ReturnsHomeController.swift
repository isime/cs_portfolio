//
//  ReturnsHomeController.swift
//  SkiClock
//
//  Created by Ian Sime on 4/1/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

class ReturnsHomeController: UIViewController {

    var store_id: Int!
    @IBOutlet weak var assetIDBox: UITextField!
    
    @IBAction func searchForReturn(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rentalSearchToFirstSkier"{
            let nextScene = segue.destination as? FristSkierReturnController
            let assest_id = assetIDBox.text ?? "0"
            nextScene!.assetID = assest_id
            nextScene!.store_id = store_id
        }
        if segue.identifier == "returnSearchToEmployeeDash"{
            let nextScene = segue.destination as? ViewController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "returnSearchToRentalsHome"{
            let nextScene = segue.destination as? RentalHomeController
            nextScene!.store_id = store_id
        }
    }
    
    func setKeyboards(){
        assetIDBox.keyboardType = .numberPad
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboards()

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
