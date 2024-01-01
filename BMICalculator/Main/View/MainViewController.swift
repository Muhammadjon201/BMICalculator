//
//  MainViewController.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 30/12/23.
//

import UIKit
import SnapKit

protocol MainViewModelType {
    func selectUser() -> User
}

enum BMITypes {
    case underweight(score: Double, message: String)
    case normalWeight(score: Double, message: String)
    case overweight(score: Double, message: String)
    case obesity(type: ObesityTypes)
    case error
}

enum ObesityTypes {
    case first(score: Double, message: String)
    case second(score: Double, message: String)
    case third(score: Double, message: String)
}

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelType = MainViewModel()
    var userData: User!
    let appNameAttText = NSMutableAttributedString()
    
    private let appName: UILabel = {
        let label = UILabel()
        label.textColor = .cBlack
        label.text = "BMI Calculator"
        return label
    }()
    
    private let aboutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let recalculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primary
        button.layer.cornerRadius = 10
        button.setTitle("Recalculate", for: .normal)
        button.addTarget(self, action: #selector(recalculateTapped), for: .touchUpInside)
        button.titleLabel?.font = .setFont(forTextStyle: .body, weight: .bold)
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Constants.topPadding
        layout.sectionInset = UIEdgeInsets(top: 0, left: Constants.sidePadding, bottom: 0, right: Constants.sidePadding)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MainCollectionPersonViewCell.self, forCellWithReuseIdentifier: "MainCollectionPersonViewCell")
        collectionView.register(MainResultCell.self, forCellWithReuseIdentifier: "MainResultCell")
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.userData = viewModel.selectUser()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        [collectionView].forEach { item in
            view.addSubview(item)
        }
        
        [appName, aboutButton,recalculateButton].forEach { item in
            view.addSubview(item)
        }
        
        appNameConfig()
        layout()

    }
    
    private func layout() {
        
        appName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(Constants.sidePadding)
        }
        
        aboutButton.snp.makeConstraints { make in
            make.centerY.equalTo(appName.snp.centerY)
            make.right.equalToSuperview().offset(-Constants.sidePadding)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(appName.snp.bottom).offset(Constants.topPadding)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        
        recalculateButton.snp.makeConstraints { make in
            make.left.equalTo(Constants.sidePadding)
            make.right.equalTo(-Constants.sidePadding)
            make.bottom.equalTo(-20)
            make.height.equalTo(Constants.buttonHeight)
        }
    }
    
    
    private func appNameConfig() {
        appNameAttText.normal("BMI", textColor: .cBlack, font: .setFont(forTextStyle: .title3, weight: .heavy))
        appNameAttText.normal("Calculator", textColor: .cBlack, font: .setFont(forTextStyle: .title3, weight: .medium), space: " ")
        self.appName.attributedText = appNameAttText
    }

}

// MARK: - Navigation Right Button
extension MainViewController {
    @objc func rightButtonTapped(){
        let vc = AboutBMIController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func recalculateTapped(){
        self.navigationController?.pushViewController(CalculateViewController(), animated: true)
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewModel = MainPageModel(
            fullName: self.userData.name ?? "",
            BMIType: BMICalculation(height: self.userData.height ?? "", weight: self.userData.weight ?? ""),
            age: self.userData.age ?? "",
            height: self.userData.height ?? "",
            weight: self.userData.weight ?? "")
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionPersonViewCell", for: indexPath) as! MainCollectionPersonViewCell
            cell.viewModel = viewModel
    
        return cell

        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainResultCell", for: indexPath) as! MainResultCell
            cell.viewModel = viewModel
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width - 30
        return CGSize(width: cellWidth, height: 300)
    }
    
    
    private func BMICalculation(height: String, weight: String) -> BMITypes {
        guard var height = Double(height) else { return BMITypes.error }
        guard let weight = Double(weight) else { return BMITypes.error }
        height = height / 100
        var score = weight / (height * height)
        score = score.rounded(toDecimal: 2)
        
        switch score {
        case 0...18.4:
            return BMITypes.underweight(score: score, message: "BMI less than 18.5")
        case 18.5...24.9:
            return BMITypes.normalWeight(score: score, message: "BMI between 18.5 and 24.9")
        case 25.0...29.9:
            return BMITypes.overweight(score: score, message: "BMI between 25 and 29.9")
        case 30.0...34.9:
            return BMITypes.obesity(type: .first(score: score, message: "Class I (Moderate obesity): BMI between 30 and 34.9"))
        case 35.0...39.9:
            return BMITypes.obesity(type: .second(score: score, message: "Class II (Severe obesity): BMI between 35 and 39.9"))
        case 40.0...100.0:
            return BMITypes.obesity(type: .third(score: score, message: "Class III (Very severe or morbid obesity): BMI of 40 and above"))
        default:
            break
        }
        
        return BMITypes.error
        
    }
    
}
