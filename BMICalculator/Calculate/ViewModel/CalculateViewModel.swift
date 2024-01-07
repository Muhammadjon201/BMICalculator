//
//  CalculateViewModel.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 30/12/23.
//

import UIKit

class CalculateViewModel: CalculateViewModelType {
    
    var CoreData: CoreDB? = CoreDB()
    var defaults = UserDefaults.standard
    
    func saveUserToDB(name: String, age: String, gender: Gender, height: String, weight: String) {
        let gender = gender == .male ? "male" : "female"
        CoreData?.addUser(name: name, age: age, gender: gender, height: height, weight: weight)
    }
    
    
    func selectUser() {
        print(CoreData?.selectAll()?.name)
    }
    
    func userLoggedIn() {
        defaults.setValue(true, forKey: KeyDefaults.login)
    }
    
}
