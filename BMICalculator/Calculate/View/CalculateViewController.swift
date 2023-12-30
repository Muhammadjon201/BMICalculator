//
//  CalculateViewController.swift
//  BMICalculator
//
//  Created by ericzero on 12/25/23.
//

import UIKit
import SnapKit

class CalculateViewController: UIViewController {
    
    let appNameAttText = NSMutableAttributedString()
    
    private let appName: UILabel = {
        let label = UILabel()
        label.textColor = .cBlack
        label.text = "BMI Calculator"
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 50
        return stackView
    }()
    
    private let nameTextField: CustomTextField = {
        let textfield = CustomTextField(title: "Your Name")
        textfield.backgroundColor = .systemGray6
        return textfield
    }()
    
    private let addressTextField: CustomTextField = {
        let textfield = CustomTextField(title: "Address")
        textfield.backgroundColor = .systemGray6
        return textfield
    }()
    
    private let birthTextField: CustomTextField = {
        let textfield = CustomTextField(title: "Date of Birth")
        textfield.backgroundColor = .systemGray6
        return textfield
    }()
    
    private let genderPicker: GenderPicker = {
        let picker = GenderPicker()
        return picker
    }()
    
    private let heightTextField: StepperTextField = {
        let textfield = StepperTextField(title: "Your Height (cm)")
        textfield.backgroundColor = .systemGray6
        textfield.text = "0"
        return textfield
    }()
    
    private let weightTextField: StepperTextField = {
        let textfield = StepperTextField(title: "Your weight (kg)")
        textfield.backgroundColor = .systemGray6
        textfield.text = "0"
        return textfield
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        appNameConfig()
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        [nameTextField, birthTextField, genderPicker, heightTextField, weightTextField].forEach { item in
            stackView.addArrangedSubview(item)
        }
        
        layout()
    }
    
    private func appNameConfig(){
        view.addSubview(appName)
        appNameAttText.normal("BMI", textColor: .primary, font: .setFont(forTextStyle: .title3, weight: .bold))
        appNameAttText.normal("Calculator", textColor: .cBlack, font: .setFont(forTextStyle: .title3, weight: .medium), space: " ")
        self.appName.attributedText = appNameAttText
    }
    
    
    private func layout(){
        appName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(Constants.sidePadding)
            make.height.equalTo(appName.intrinsicContentSize.height)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(appName.snp.bottom).offset(50)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-15)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.top).offset(30)
            make.leading.equalToSuperview().offset(Constants.sidePadding)
            make.trailing.equalToSuperview().offset(-Constants.sidePadding)
            make.height.equalTo(Constants.buttonHeight)
        }
        
//        addressTextField.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(Constants.sidePadding)
//            make.trailing.equalToSuperview().offset(-Constants.sidePadding)
//            make.height.equalTo(Constants.buttonHeight)
//        }
        
        birthTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.sidePadding)
            make.trailing.equalToSuperview().offset(-Constants.sidePadding)
            make.height.equalTo(Constants.buttonHeight)
        }
        
        genderPicker.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.sidePadding)
            make.trailing.equalToSuperview().offset(-Constants.sidePadding)
            make.height.equalTo(160)
        }
        
        heightTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.sidePadding)
            make.trailing.equalToSuperview().offset(-Constants.sidePadding)
            make.height.equalTo(Constants.buttonHeight)
        }
        
        weightTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.sidePadding)
            make.trailing.equalToSuperview().offset(-Constants.sidePadding)
            make.height.equalTo(Constants.buttonHeight)
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
