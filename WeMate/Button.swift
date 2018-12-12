//
//  Button.swift
//  WeMate
//
//  Created by Vaibhav Jaiswal on 13/12/18.
//  Copyright © 2018 Yash Nayak. All rights reserved.
//

import UIKit
@IBDesignable
class Button: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
