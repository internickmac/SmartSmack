//
//  CreateAccountVC.swift
//  SmartSmack
//
//  Created by Admin on 29/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
