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
                self.bmiResultNumber.text = "\(score)"
                self.bmiResultLabel.text = "\(message)"
            case .normalWeight(let score, let message):
                self.bmiResultNumber.text = "\(score)"
                self.bmiResultLabel.text = "\(message)"
            case .overweight(let score, let message):
                self.bmiResultNumber.text = "\(score)"
                self.bmiResultLabel.text = "\(message)"
            case .obesity(let type):
                switch type {
                case .first(let score, let message):
                    self.bmiResultNumber.text = "\(score)"
                    self.bmiResultLabel.text = "\(message)"
                case .second(let score, let message):
                    self.bmiResultNumber.text = "\(score)"
                    self.bmiResultLabel.text = "\(message)"
                case .third(let score, let message):
                    self.bmiResultNumber.text = "\(score)"
                    self.bmiResultLabel.text = "\(message)"
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
        label.textColor = .white
        return label
    }()
    
    private let resultDefinition: UITextView = {
        let textView = UITextView()
        textView.textColor = .white
        textView.backgroundColor = .black
        textView.font = .setFont(forTextStyle: .body, weight: .regular)
        textView.isEditable = false
        textView.text = "If your BMI falls below the range of 18.5, it indicates that you are underweight. Being underweight may suggest a variety of health concerns, including insufficient nutrition, potential malnutrition, or other underlying health issues"
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
    
    private func layout(){
        
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
    
}
