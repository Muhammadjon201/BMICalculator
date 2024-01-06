//
//  MainResultCell.swift
//  BMICalculator
//
//  Created by ericzero on 12/31/23.
//

import UIKit
import SnapKit

class MainResultCell: UICollectionViewCell {
    
    var viewModel: MainPageModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            switch viewModel.BMIType {
            case .underweight(let score, let message):
                updateLabels(score: score, message: message)
                updateBmiResultNumberColor(color: .systemMint)
                updateResultDefinitionLabel(description: "If your BMI falls below the range of 18.5, it indicates that you are underweight. Being underweight may suggest a variety of health concerns, including insufficient nutrition, potential malnutrition, or other underlying health issues.")
            case .normalWeight(let score, let message):
                updateLabels(score: score, message: message)
                updateBmiResultNumberColor(color: .green)
                updateResultDefinitionLabel(description: "Your BMI is within the normal range (18.5 to 24.9), which is considered healthy. Keep maintaining a balanced lifestyle to stay in this range.")
            case .overweight(let score, let message):
                updateLabels(score: score, message: message)
                updateBmiResultNumberColor(color: .yellow)
                updateResultDefinitionLabel(description: "If your BMI is between 25 and 29.9, it indicates that you are overweight. Consider adopting a healthier lifestyle, including regular exercise and a balanced diet.")
            case .obesity(let type):
                switch type {
                case .first(let score, let message):
                    updateLabels(score: score, message: message)
                    updateBmiResultNumberColor(color: .orange)
                    updateResultDefinitionLabel(description: "Your BMI is in the range of 30 to 34.9, classified as Class I (Moderate obesity). It's essential to address this condition for better health outcomes.")
                case .second(let score, let message):
                    updateLabels(score: score, message: message)
                    updateBmiResultNumberColor(color: .red)
                    updateResultDefinitionLabel(description: "Your BMI is in the range of 35 to 39.9, classified as Class II (Severe obesity). Consider consulting with a healthcare professional to manage your weight.")
                case .third(let score, let message):
                    updateLabels(score: score, message: message)
                    updateResultDefinitionLabel(description: "Your BMI is 40 or above, classified as Class III (Very severe or morbid obesity). It's crucial to seek medical advice for weight management and overall health.")
                }
            case .error:
                break
            }
        }
    }
    
    private let bmiResultLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title3, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let bmiResultNumber: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .body, weight: .regular)
        label.textColor = .green
        return label
    }()
    
    private let resultDefinition: UITextView = {
        let textView = UITextView()
        textView.textColor = .white
        textView.backgroundColor = .black
        textView.font = .setFont(forTextStyle: .body, weight: .regular)
        textView.isEditable = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .black
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        
        [bmiResultLabel, bmiResultNumber, resultDefinition].forEach { item in
            addSubview(item)
        }
        
        layout()
    }
    
    private func layout() {
        
        bmiResultLabel.snp.makeConstraints { make in
            make.top.equalTo(Constants.topPadding)
            make.left.equalTo(Constants.sidePadding)
        }
        
        bmiResultNumber.snp.makeConstraints { make in
            make.top.equalTo(bmiResultLabel.snp.bottom).offset(5)
            make.left.equalTo(Constants.sidePadding)
        }
        
        resultDefinition.snp.makeConstraints { make in
            make.top.equalTo(bmiResultNumber.snp.bottom).offset(30)
            make.left.equalTo(Constants.sidePadding)
            make.right.equalTo(-Constants.sidePadding)
            make.bottom.equalTo(-Constants.topPadding)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateLabels(score: Double, message: String) {
        self.bmiResultNumber.text = "\(score)"
        self.bmiResultLabel.text = "\(message)"
    }
    
    private func updateResultDefinitionLabel(description: String) {
        self.resultDefinition.text = description
    }
    
    private func updateBmiResultNumberColor(color: UIColor) {
        self.bmiResultNumber.textColor = color
    }
}

