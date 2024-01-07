//
//  Double.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 01/01/24.
//

import Foundation

extension Double {
    func rounded(toDecimal places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
