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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        appNameConfig()
        
        [appName].forEach { item in
            view.addSubview(item)
        }
        layout()
    }
    
    private func appNameConfig(){
        appNameAttText.normal("BMI", textColor: .primary, font: .setFont(forTextStyle: .title3, weight: .bold))
        appNameAttText.normal("Calculator", textColor: .cBlack, font: .setFont(forTextStyle: .title3, weight: .medium), space: " ")
        self.appName.attributedText = appNameAttText
    }
    
    private func layout(){
        appName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(Constants.sidePadding)
        }
    }
    
}
