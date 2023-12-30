//
//  MainCollectionPersonViewCell.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 30/12/23.
//

import UIKit

class MainCollectionPersonViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionPersonViewCell"
    
    private let userFullName: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title3, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let score: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .title2, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(forTextStyle: .body, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        [userFullName].forEach { item in
            addSubview(item)
        }
        
        layout()
        
    }
    
    
    private func layout() {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
