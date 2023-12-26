//
//  CustomTextField.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 26/12/23.
//

import UIKit
import SnapKit

class CustomTextField: UITextField {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .setFont(forTextStyle: .callout, weight: .medium)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    
    var title: String
    
    init(title: String) {
        self.title = title
        self.titleLabel.text = title
        super.init(frame: .zero)
        
        configuration()
        
        [titleLabel].forEach { item in
            addSubview(item)
        }
        
        layout()
        
    }
    
    
    private func configuration() {
        self.layer.cornerRadius = 10
        self.setPadding(20, side: .both)
    }
    
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.top).offset(-Constants.minorPadding)
            make.leading.equalTo(self.snp.leading)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
