//
//  AboutBMIController.swift
//  BMICalculator
//
//  Created by ericzero on 12/31/23.
//

import UIKit

class AboutBMIController: UIViewController {
    
    private let aboutBMILabel: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = .setFont(forTextStyle: .body, weight: .regular)
        textView.text = """

        Body Mass Index (BMI) is a numerical indicator derived from an individual's weight and height. It serves as a valuable tool to assess whether a person maintains a healthy body weight. BMI is calculated by dividing the body mass by the square of the body height, expressed in units of kg/m2, with weight in kilograms and height in meters.

        The Harris-Benedict equation, also referred to as the Harris-Benedict principle, offers a method to estimate a person's Basal Metabolic Rate (BMR). This BMR value can be adjusted based on the individual's activity level, providing an estimate of the daily calorie intake required to sustain their current weight.

        It is crucial to understand that the calculations performed by this app are not intended to replace professional medical advice. The app's content, encompassing text, graphics, images, and other materials, is designed for informational and educational purposes exclusively. It does not substitute the need for consultation with a healthcare professional for medical advice, diagnosis, or treatment.

        While diligent efforts are made to keep the medical information in our app current, we cannot guarantee that it reflects the latest research. For personalized medical guidance tailored to your specific circumstances, we strongly recommend consulting with your physician.

        Our aim is to empower users with knowledge about BMI and metabolic rates, fostering a healthier understanding of their bodies and facilitating informed discussions with healthcare professionals.
        
        """
        textView.isEditable = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Info"
        
        config()
        layout()
    }
    
    private func config(){
        [aboutBMILabel].forEach { item in
            view.addSubview(item)
        }
    }
    
    private func layout(){
        aboutBMILabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
        }
    }
    
}
