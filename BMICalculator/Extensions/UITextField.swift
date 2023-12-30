//
//  UITextField.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 26/12/23.
//

import UIKit

enum TextFieldPaddingSide {
    case left
    case right
    case both
}

extension UITextField {
    func setPadding(_ amount: CGFloat, side: TextFieldPaddingSide) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        
        if side == .left {
            leftView = paddingView
        } else if side == .right {
            rightView = paddingView
        } else {
            leftView = paddingView
            rightView = paddingView
        }
        
        leftViewMode = .always
        rightViewMode = .always
    }
}
