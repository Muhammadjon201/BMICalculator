//
//  MainViewModel.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 01/01/24.
//

import UIKit

class MainViewModel: MainViewModelType {
    
    var CoreData: CoreDB? = CoreDB()
    
    func selectUser() -> User {
        guard let user = self.CoreData?.selectAll() else { return User() }
        return user
    }
}
