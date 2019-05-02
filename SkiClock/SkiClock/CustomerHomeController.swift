//
//  CustomerHomeController.swift
//  SkiClock
//
//  Created by Ian Sime on 4/15/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

struct CustomerName: Decodable {
    let first_name: String?
}

class CustomerHomeController: UIViewController {
    var customer_id: Int!
    var first_name: String = "No Customer"
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CustomerHomeToSkierList"{
            let nextScene = segue.destination as? CustomerSkierListController
            nextScene!.customer_id = self.customer_id
        }
        if segue.identifier == "CustomerHomeToRentalList"{
            let nextScene = segue.destination as? CustomerRentalsListController
            nextScene!.customer_id = self.customer_id
        }
    }
    
    func setWelcome(){
        if first_name == "No Customer"{
            WelcomeLabel.text = "No Customer with ID: " + String(customer_id)
            WelcomeLabel.textColor = UIColor.red
        }
        else {
         WelcomeLabel.text = "Welcome " + first_name
            WelcomeLabel.textColor = UIColor.black
        }
    }
    
    func getName(){
        let nameUrl = "http://10.0.0.7:5000/customer_name/" + String(customer_id)
        guard let url = URL(string: nameUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let info = try JSONDecoder().decode(CustomerName.self, from: data)
                print(info)
                
                self.first_name = info.first_name ?? "No Customer"
                
                DispatchQueue.main.async {
                    self.setWelcome()
                }
            } catch let jsonErr { }
        }.resume()
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getName()
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
