//
//  ChatVC.swift
//  SmartSmack
//
//  Created by Admin on 23/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuBtn.addTarget(self.revealViewController() ,
                          action: #selector(SWRevealViewController.revealToggle(_:)),
                          for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLogginIn {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_GHANGE, object: nil)
            }
        }
    }

    
}
