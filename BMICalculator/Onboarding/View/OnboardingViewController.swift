//
//  ViewController.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 22/12/23.
//

import UIKit
import SnapKit

protocol OnboardingViewModelType {
    
}

class OnboardingViewController: UIViewController {
    
    var viewModel: OnboardingViewModelType = OnboardingViewModel()
    let attributedText = NSMutableAttributedString()
    let fonts = Fonts()
    
    private let appName: UILabel = {
        let appName = UILabel()
        appName.textColor = .cBlack
        appName.text = "BMI Calculator"
        return appName
    }()
    
    private let lowerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lowerViewColor")
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let onboardImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "biker")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    
    private let startButton: UIButton = {
        return UIButton.customButton(title: "Get Started", titleColor: .white, backgroundColor: .cBlack, cornerRadius: 10, target: self, action: #selector(getStartedPressed))
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        appNameConfig()
        view.addSubview(appName)
        view.addSubview(lowerView)
        view.addSubview(onboardImage)
        lowerView.addSubview(startButton)
        lowerView.addSubview(lineView)
        layout()
        
    }
    
    private func appNameConfig() {
//        attributedText.normal("BMI", textColor: .primary, font: .setFont(forTextStyle: .title3, weight: .bold))
//        attributedText.normal("Calculator", textColor: .cBlack, font: .setFont(forTextStyle: .title3, weight: .medium), space: " ")
//        self.appName.attributedText = attributedText
        
        if let urbanianBoldFont = UIFont(name: fonts.urbanianBold, size: 20),
           let urbanianSemiboldFont = UIFont(name: fonts.urbanianSemibold, size: 16) {

            let attributedText = NSMutableAttributedString(string: "BMI ", attributes: [NSAttributedString.Key.font: urbanianBoldFont])
            attributedText.append(NSAttributedString(string: "calculator", attributes: [NSAttributedString.Key.font: urbanianSemiboldFont]))

        } else {
            print("One or more fonts not found.")
        }
    }
    
    private func layout() {
        appName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.topPadding)
            make.left.equalToSuperview().offset(Constants.sidePadding)
        }

        onboardImage.snp.makeConstraints { make in
            make.top.equalTo(appName.snp.bottom).offset(40)
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        lowerView.snp.makeConstraints { make in
            make.top.equalTo(onboardImage.snp.bottom).offset(40)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(-25)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(40)
        }
        
        lineView.snp.makeConstraints { make in
            make.bottom.equalTo(startButton.snp.top).offset(-15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(1)
        }

    }

    //MARK: - Actions
    
    @objc func getStartedPressed() {
        print("working fine")
    }
    
}

