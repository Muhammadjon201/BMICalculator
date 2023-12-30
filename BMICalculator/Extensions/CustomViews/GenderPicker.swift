//
//  GenderPicker.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 26/12/23.
//

import UIKit
import SnapKit

enum Gender {
    case male
    case female
}

class GenderPicker: UIView {
    
    var selectedGender: Gender?
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .setFont(forTextStyle: .callout, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.text = "Select Gender"
        return titleLabel
    }()
    
    private let maleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "male")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.primary.cgColor
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let femaleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "female")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.primary.cgColor
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        [maleImageView, femaleImageView, titleLabel].forEach { item in
            addSubview(item)
        }
        
        layout()
        clickActions()
        
    }
    
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.height.equalTo(titleLabel.intrinsicContentSize.height)
        }
        
        maleImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.sidePadding)
            make.leading.equalTo(self.snp.leading)
            make.bottom.equalTo(self.snp.bottom).offset(-Constants.minorPadding)
            make.width.equalTo(Constants.screenWidth / 2 - 15)
        }
        
        femaleImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.sidePadding)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).offset(-Constants.minorPadding)
            make.width.equalTo(Constants.screenWidth / 2 - 15)
        }
    }
    
    
    private func clickActions() {
        let maleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(maleSelect))
        self.maleImageView.addGestureRecognizer(maleTapRecognizer)
        
        let femaleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(femaleSelect))
        self.femaleImageView.addGestureRecognizer(femaleTapRecognizer)
    }
    
    
    @objc
    func maleSelect() {
        femaleImageView.layer.borderWidth = 0
        maleImageView.layer.borderWidth = 2
        self.selectedGender = .male
    }
    
    
    @objc
    func femaleSelect() {
        maleImageView.layer.borderWidth = 0
        femaleImageView.layer.borderWidth = 2
        self.selectedGender = .female
    }
    
    
    func emptyError() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
