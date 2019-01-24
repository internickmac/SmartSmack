//
//  ChannelVC.swift
//  SmartSmack
//
//  Created by Admin on 23/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
}
