//
//  ChannelVC.swift
//  SmartSmack
//
//  Created by Admin on 23/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    //outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    
    @IBAction func prepareForUnwin(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChance(_:)),
                                               name: NOTIF_USER_DATA_DID_GHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLogginIn {
            //do something
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @objc func userDataDidChance(_ notif: Notification) {
        setupUserInfo()
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLogginIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
            
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
}





