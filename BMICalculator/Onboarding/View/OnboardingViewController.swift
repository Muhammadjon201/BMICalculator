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
    let appNameAttText = NSMutableAttributedString()
    let taglineAttText = NSMutableAttributedString()
    
    private let appName: UILabel = {
        let label = UILabel()
        label.textColor = .cBlack
        label.text = "BMI Calculator"
        return label
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
        let imageView = UIImageView()
        imageView.image = UIImage(named: "biker")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let startButton: UIButton = {
        return UIButton.customButton(title: "Get Started", titleColor: .white, backgroundColor: .cBlack, cornerRadius: 10, target: self, action: #selector(getStartedPressed))
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let tagline: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let subHeadline: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.text = "Easily calculate your Body Mass Index (BMI) by entering your height and width."
        label.textColor = .white
        label.font = .setFont(forTextStyle: .callout, weight: .regular)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [appName, onboardImage, lowerView].forEach { item in
            view.addSubview(item)
        }
        
        [tagline, subHeadline, startButton, lineView].forEach { item in
            lowerView.addSubview(item)
        }
        
        appNameConfig()
        layout()
        
    }
    
    private func appNameConfig() {
        appNameAttText.normal("BMI", textColor: .cBlack, font: .setFont(forTextStyle: .title3, weight: .heavy))
        appNameAttText.normal("Calculator", textColor: .cBlack, font: .setFont(forTextStyle: .title3, weight: .medium), space: " ")
        self.appName.attributedText = appNameAttText
        
        taglineAttText.normal("Unveiling the Secrets", textColor: .white, font: .setFont(forTextStyle: .largeTitle, weight: .bold))
        taglineAttText.normal("of Your Body's Balance!", textColor: .white, font: .setFont(forTextStyle: .largeTitle, weight: .regular), space: " ")
        self.tagline.attributedText = taglineAttText
    }
    
    private func layout() {
        appName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
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
        
        tagline.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.topPadding)
            make.leading.equalToSuperview().offset(Constants.sidePadding)
            make.trailing.equalToSuperview().offset(Calculation.setHeight(-120))
        }
        
        subHeadline.snp.makeConstraints { make in
            make.bottom.equalTo(lineView.snp.top).offset(-Constants.topPadding)
            make.leading.equalTo(tagline.snp.leading)
            make.trailing.equalToSuperview().offset(-Constants.sidePadding)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-Calculation.setHeight(25))
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(Calculation.setHeight(Constants.buttonHeight))
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
        let vc = CalculateViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

