//
//  CoreDB.swift
//  BMICalculator
//
//  Created by Narzullaev Nurbek on 30/12/23.
//

import CoreData
import UIKit


class CoreDB {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func addUser(name: String, age: String, gender: String, height: String, weight: String) {
        self.deleteAllUsers()
        
        let user = User(context: context)
        user.name = name
        user.age = age
        user.gender = gender
        user.height = height
        user.weight = weight
        
        do {
            try context.save()
        }
        catch {
            print("Error has occured while saving user -> addUser func")
        }
        
    }
    
    
    func selectAll() -> User? {
        var user: User?

        do {
            user = try context.fetch(User.fetchRequest()).first
        }
        catch {
            print("Error while selecting users list")
        }
        
        return user
    }
    
    
    func deleteAllUsers() {
        var users: [User]?

        do {
            users = try context.fetch(User.fetchRequest())
        }
        catch {
            print("Error while getting users list")
        }

        
        do {
            guard let users = users else {
                print("Error in deleteAll method in CoreData")
                return
            }
            
            for user in users {
                context.delete(user)
                try context.save()
            }
        }
        catch {
            print("Error while deleting")
        }
        
    }
    
    
    deinit {
        print("CoreDB is being deinited")
    }
    
}
