//
//  AvatarCell.swift
//  SmartSmack
//
//  Created by Admin on 14/02/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {

    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
