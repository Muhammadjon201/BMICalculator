//
//  Calculation.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 24/12/23.
//

import UIKit

struct Calculation {
    static func setHeight(_ value: Double) -> CGFloat {
        let width = 393.0
        let percent = value / (width / 100) // 12.7%
        let result = percent  * (Constants.screenWidth / 100)
        return CGFloat(result)
    }
}
