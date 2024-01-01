//
//  MainCollectionPersonViewCell.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 30/12/23.
//

import UIKit
import SnapKit

class MainCollectionPersonViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionPersonViewCell"
    
    var viewModel: MainPageModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }

            userFullName.text = viewModel.fullName
            score.text = viewModel.score
            scoreLabel.text = viewModel.scoreLabel
            personImageView.image = UIImage(named: viewModel.personImage)
            // Set other labels accordingly

            ageNumberLabel.text = viewModel.age
            ageYearsLabel.text = viewModel.ageYears
            ageLabel.text = viewModel.ageLbl

            heightNumberLabel.text = viewModel.height
            heightCmLabel.text = viewModel.heightCm
            heightLabel.text = viewModel.heightLbl

            weightNumberLabel.text = viewModel.kgNumber
            weightKgLabel.text = viewModel.kgKg
            weightLabel.text = viewModel.kgWeight
        }
    }

    
    private let userFullName: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title3, weight: .heavy)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private let score: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .largeTitle, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .body, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "human")
        imageView.tintColor = .white
        return imageView
    }()
    
    private let ageNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title3, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let ageYearsLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title3, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .body, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let verticalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let heightNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title3, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let heightCmLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title3, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .body, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let weightNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title3, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let weightKgLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title3, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .body, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let scoreStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private let heightStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .lowerView
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        
        [userFullName, personImageView, ageLabel, ageYearsLabel, ageNumberLabel, weightLabel, weightKgLabel, weightNumberLabel, heightLabel].forEach { item in
            addSubview(item)
        }
        
        [scoreStackView, heightStackView].forEach { item in
            addSubview(item)
        }
        
        
        
        [score, scoreLabel].forEach { item in
            scoreStackView.addArrangedSubview(item)
        }
        
        [heightNumberLabel, heightCmLabel].forEach { item in
            heightStackView.addArrangedSubview(item)
        }
        
        layout()
        
    }
    
    
    private func layout() {
        userFullName.snp.makeConstraints { make in
            make.top.equalTo(Constants.topPadding)
            make.left.equalTo(30)
        }
        
        scoreStackView.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.centerY.equalToSuperview()
        }
        
        personImageView.snp.makeConstraints { make in
            make.top.equalTo(Constants.topPadding)
            make.left.equalTo(userFullName.snp.right).offset(Constants.sidePadding)
            make.right.equalTo(-Constants.sidePadding)
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-Constants.topPadding)
            make.left.equalTo(45)
        }
        
        ageNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.bottom.equalTo(ageLabel.snp.top).offset(-5)
        }
        
        ageYearsLabel.snp.makeConstraints { make in
            make.left.equalTo(ageNumberLabel.snp.right).offset(5)
            make.bottom.equalTo(ageLabel.snp.top).offset(-5)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-Constants.topPadding)
            make.right.equalTo(-45)
        }
        
        weightKgLabel.snp.makeConstraints { make in
            make.right.equalTo(-45)
            make.bottom.equalTo(weightLabel.snp.top).offset(-5)
        }
        
        weightNumberLabel.snp.makeConstraints { make in
            make.bottom.equalTo(weightLabel.snp.top).offset(-5)
            make.right.equalTo(weightKgLabel.snp.left).offset(-5)
        }
        
        heightLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-Constants.topPadding)
            make.centerX.equalToSuperview()
        }
        
        heightStackView.snp.makeConstraints { make in
            make.bottom.equalTo(heightLabel.snp.top).offset(-5)
            make.centerX.equalToSuperview()
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
