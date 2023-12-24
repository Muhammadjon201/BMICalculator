//
//  UIButton.swift
//  BMICalculator
//
//  Created by ericzero on 12/24/23.
//

import UIKit

extension UIButton {
    class func customButton(title: String, titleColor: UIColor = .white, backgroundColor: UIColor = .blue, cornerRadius: CGFloat = 8, target: Any?, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
    
}
