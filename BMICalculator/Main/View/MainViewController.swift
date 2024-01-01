//
//  MainViewController.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 30/12/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let appNameAttText = NSMutableAttributedString()
    
    let infos = MainPageModel(fullName: "MUHAMMADJON", score: "20", scoreLabel: "BMI Score", personImage: "human", age: "24", ageYears: "yrs", ageLbl: "Age", height: "176", heightCm: "cm", heightLbl: "height", kgNumber: "75", kgKg: "kg", kgWeight: "weight")
    
    let bmiResult = BmiResultModel(resultLabel: "Underweight", resultNumber: "(BMI less than 18.5)", resultDefinition: "If your BMI falls below the range of 18.5, it indicates that you are underweight. Being underweight may suggest a variety of health concerns, including insufficient nutrition, potential malnutrition, or other underlying health issues")
    
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
        
        self.navigationItem.setHidesBackButton(true, animated: true)

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
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionPersonViewCell", for: indexPath) as! MainCollectionPersonViewCell
            cell.viewModel = infos
    
        return cell

        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainResultCell", for: indexPath) as! MainResultCell
            cell.viewModel = bmiResult
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width - 30
        return CGSize(width: cellWidth, height: 300)
    }
}
