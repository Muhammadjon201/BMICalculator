//
//  UIFont.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 22/12/23.
//

import UIKit

extension UIFont {
    class func setFont(forTextStyle style: UIFont.TextStyle, weight: Weight) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style)
        let descriptor = preferredFont(forTextStyle: style).fontDescriptor
        let dynamicSize = descriptor.pointSize
        let fontToScale: UIFont = UIFont.systemFont(ofSize: dynamicSize, weight: weight)
        return metrics.scaledFont(for: fontToScale)
    }
}
