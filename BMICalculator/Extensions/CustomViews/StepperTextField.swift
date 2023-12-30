//
//  StepperTextField.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 26/12/23.
//

import UIKit
import SnapKit

class StepperTextField: UITextField {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .setFont(forTextStyle: .callout, weight: .medium)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    private let decrementButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .primary
        button.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private let incrementButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .primary
        button.addTarget(self, action: #selector(increment), for: .touchUpInside)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    
    var title: String
    
    init(title: String) {
        self.title = title
        self.titleLabel.text = title
        super.init(frame: .zero)
        
        configuration()
        
        [titleLabel, decrementButton, incrementButton].forEach { item in
            addSubview(item)
        }
        
        layout()
        
    }
    
    
    private func configuration() {
        self.backgroundColor = .systemGray3
        self.layer.cornerRadius = 10
        self.textAlignment = .center
        self.keyboardType = .numberPad
        self.font = .setFont(forTextStyle: .title3, weight: .semibold)
        self.setPadding(50, side: .both)
        self.delegate = self
    }
    
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.top).offset(-Constants.minorPadding)
            make.leading.equalTo(self.snp.leading)
        }
        
        incrementButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalTo(self.snp.trailing).offset(-Constants.sidePadding)
            make.size.equalTo(25)
        }
        
        decrementButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self.snp.leading).offset(Constants.sidePadding)
            make.size.equalTo(25)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension StepperTextField {
    @objc
    func increment() {
        if let text = self.text, let textInteger = Int(text) {
            var value = textInteger + 1
            self.text = "\(value)"
        }
    }
    
    @objc
    func decrement() {
        if let text = self.text, let textInteger = Int(text) {
            var value = textInteger - 1
            self.text = "\(value)"
        }
    }
}


extension StepperTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.decrementButton.enabled()
        self.incrementButton.enabled()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.decrementButton.disabled()
        self.incrementButton.disabled()
    }
    
    func emptyError() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
    }
}

