//
//  String.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 22/12/23.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    func normal(_ value: String, textColor: UIColor = .black, font: UIFont = .setFont(forTextStyle: .body, weight: .regular), space: String = "") {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : font,
            .foregroundColor: textColor,
        ]
        
        self.append(NSAttributedString(string: space + value, attributes: attributes))
    }
}
