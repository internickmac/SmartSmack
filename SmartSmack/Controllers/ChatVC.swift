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
    @IBOutlet weak var channelNameLbl: UILabel!
    @IBOutlet weak var messageTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ChatVC.handleTap(_:)))
        view.addGestureRecognizer(tap)
        
        menuBtn.addTarget(self.revealViewController() ,
                          action: #selector(SWRevealViewController.revealToggle(_:)),
                          for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)),
                                               name: NOTIF_USER_DATA_DID_GHANGE, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)),
                                               name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLogginIn {
            AuthService.instance.findUserByEmail (completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_GHANGE, object: nil)
            })
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLogginIn {
            onLoginGetMessages()
        } else {
            channelNameLbl.text = "Please login..."
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    
    @objc func handleTap(_ notif: Notification) {
        view.endEditing(true)
    }
    
    func updateWithChannel() {
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLbl.text = "#\(channelName)"
        getMessages()
    }
    
    @IBAction func sendMsgPressed(_ sender: Any) {
        if AuthService.instance.isLogginIn {
            guard let channelId = MessageService.instance.selectedChannel?.id else { return }
            guard let message = messageTextBox.text else { return }
            
            SocketService.instance.addMessage(messageBody: message, userId:
                UserDataService.instance.id, channelId: channelId, completion: { (success) in
                    if success {
                        self.messageTextBox.text = ""
                        self.messageTextBox.resignFirstResponder()
                    }
            })
        }
    }
    
    func onLoginGetMessages() {
        MessageService.instance.findAllChannel { (success) in
            if success {
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                } else {
                    self.channelNameLbl.text = "No channels yet"
                }
            }
        }
    }
    
    func getMessages() {
        guard let channelId = MessageService.instance.selectedChannel?.id else { return }
        MessageService.instance.findAllMessageForChannel(channelId: channelId) { (success) in
            
        }
    }
}











