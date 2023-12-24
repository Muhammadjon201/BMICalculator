//
//  UIFont.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 22/12/23.
//

import UIKit

//extension UIFont {
//    class func setFont(forTextStyle style: UIFont.TextStyle, weight: Weight) -> UIFont {
//        let metrics = UIFontMetrics(forTextStyle: style)
//        let descriptor = preferredFont(forTextStyle: style).fontDescriptor
//        var dynamicSize = descriptor.pointSize
//        var fontToScale: UIFont!
//
//        switch weight {
//        case .light:
//            fontToScale = UIFont.systemFont(ofSize: dynamicSize, weight: .light)
//        case .regular:
//            fontToScale = UIFont(name: "Urbanist-Regular", size: dynamicSize)
//        case .medium:
//            fontToScale = UIFont(name: "Urbanist-Medium", size: dynamicSize)
//        case .semibold:
//            fontToScale = UIFont(name: "Urbanist-SemiBold", size: dynamicSize)
//        case .bold:
//            fontToScale = UIFont(name: "Urbanist-Bold", size: dynamicSize)
//        case .heavy:
//            fontToScale = UIFont.systemFont(ofSize: dynamicSize, weight: .heavy)
//        default:
//            print("No Font Found")
//        }
//
//        return metrics.scaledFont(for: fontToScale)
//    }
//}

struct Fonts {
    let urbanianRegular: String = "Urbanist-Regular"
    let urbanianMedium: String = "Urbanist-Medium"
    let urbanianSemibold: String = "Urbanist-SemiBold"
    let urbanianBold: String = "Urbanist-Bold"
}
