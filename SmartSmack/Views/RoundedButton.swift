//
//  RoundedButton.swift
//  SmartSmack
//
//  Created by Admin on 11/02/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
}
