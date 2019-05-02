//
//  EquipmentHomeController.swift
//  SkiClock
//
//  Created by Ian Sime on 3/7/19.
//  Copyright © 2019 Ian Sime. All rights reserved.
//

import UIKit

class EquipmentHomeController: UIViewController {
    var store_id: Int!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "equipmentHomeToAllSkis"{
            let nextScene = segue.destination as? AllSkisListController
            nextScene!.store_id = store_id
            
        }
        if segue.identifier == "equipmentHomeToSkisIn"{
            let nextScene = segue.destination as? EquipmentListController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "equipmentHomeToSkisOut"{
            let nextScene = segue.destination as? SkisOutController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "equipmentHomeToBootsIn"{
            let nextScene = segue.destination as? BootsInController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "equipmentHomeToBootsOut"{
            let nextScene = segue.destination as? BootsOutController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "equipmentHomeToAllBoots"{
            let nextScene = segue.destination as? AllBootsController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "equipmentHomeToEmployeeDash"{
            let nextScene = segue.destination as? ViewController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "equipmentHomeToHelmetsIn"{
            let nextScene = segue.destination as? HelmetsInController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "equipmentHomeToHelmetsOut"{
            let nextScene = segue.destination as? HelmetsOutController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "equipmentHomeToAllHelmets"{
            let nextScene = segue.destination as? AllHelmetsController
            nextScene!.store_id = store_id
        }
        if segue.identifier == "equipmentHomeToTransfer"{
            let nextScene = segue.destination as? TransferController
            nextScene!.store_id = store_id
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
