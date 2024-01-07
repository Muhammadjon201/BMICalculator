//
//  CalculateViewController.swift
//  BMICalculator
//
//  Created by ericzero on 12/25/23.
//

import UIKit
import SnapKit

protocol CalculateViewModelType {
    func saveUserToDB(name: String, age: String, gender: Gender, height: String, weight: String)
    func selectUser()
    func userLoggedIn()
}

class CalculateViewController: UIViewController {
    
    var viewModel: CalculateViewModelType = CalculateViewModel()
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
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .words
        return textfield
    }()
    
    private let ageTextField: CustomTextField = {
        let textfield = CustomTextField(title: "Age")
        textfield.backgroundColor = .systemGray6
        textfield.autocorrectionType = .no
        textfield.keyboardType = .numberPad
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
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primary
        button.layer.cornerRadius = 10
        button.setTitle("Calculate BMI", for: .normal)
        button.addTarget(self, action: #selector(confirmDidClick), for: .touchUpInside)
        button.titleLabel?.font = .setFont(forTextStyle: .body, weight: .bold)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        appNameConfig()
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        [nameTextField, ageTextField, genderPicker, heightTextField, weightTextField, confirmButton].forEach { item in
            stackView.addArrangedSubview(item)
        }
        
        layout()
        
        viewModel.selectUser()

    }
    
    
    
    
    
    private func appNameConfig(){
        view.addSubview(appName)
        appNameAttText.normal("BMI", textColor: .cBlack, font: .setFont(forTextStyle: .title3, weight: .heavy))
        appNameAttText.normal("Calculator", textColor: .cBlack, font: .setFont(forTextStyle: .title3, weight: .medium), space: " ")
        self.appName.attributedText = appNameAttText
        
        nameTextField.inputAccessoryView = toolBar()
        ageTextField.delegate = self
        ageTextField.inputAccessoryView = toolBar()
        heightTextField.delegate = self
        heightTextField.inputAccessoryView = toolBar()
        weightTextField.delegate = self
        weightTextField.inputAccessoryView = toolBar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.size.height, right: 0)
            scrollView.contentInset = contentInsets
        }
    }
    
    
    @objc
    func keyboardWillHide() {
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    
    private func toolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(toolBarDoneClick))
       
        toolbar.setItems([flexButton, doneButton], animated: true)
        
        return toolbar
    }
    
    
    @objc
    func toolBarDoneClick() {
        view.endEditing(true)
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
        
        ageTextField.snp.makeConstraints { make in
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
        
        confirmButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.sidePadding)
            make.trailing.equalToSuperview().offset(-Constants.sidePadding)
            make.height.equalTo(Constants.buttonHeight)
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}


extension CalculateViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "0" {
            textField.text = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.text = "0"
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField != nameTextField {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        } else {
            return true
        }
    }

    
    @objc
    func confirmDidClick() {
        guard let name = self.nameTextField.text else { return }
        guard let age = self.ageTextField.text else { return }
        guard let height = self.heightTextField.text else { return }
        guard let weight = self.weightTextField.text else { return }
        let gender = self.genderPicker.selectedGender
        
        if name.isEmpty {
            self.nameTextField.emptyError()
        }
        if age.isEmpty {
            self.ageTextField.emptyError()
        }
        if height == "0" {
            self.heightTextField.emptyError()
        }
        if weight == "0" {
            self.weightTextField.emptyError()
        }
        if gender == nil {
            self.genderPicker.emptyError()
        }
        
        if name.isEmpty == false &&
            age.isEmpty == false &&
            height != "0" &&
            weight != "0" &&
            gender != nil {
            
            viewModel.saveUserToDB(
                name: name,
                age: age,
                gender: gender!,
                height: height,
                weight: weight)
            
            let destinationVC = MainViewController()
            self.viewModel.userLoggedIn()
            self.navigationController?.setViewControllers([destinationVC], animated: true)
        }
    }

    
}
