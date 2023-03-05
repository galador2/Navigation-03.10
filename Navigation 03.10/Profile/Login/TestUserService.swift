//
//  TestUserService.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 05.03.2023.
//

import UIKit

class TestUserService:UserService{
    
    var user = User(loginUser: "1", fullName: "Kostenko", avatar: UIImage(named: "first"), status: "study")
    
    func service(login: String) -> User? {
        if login == user.loginUser{
            return user
        } else {
            return nil
        }
    }
    
    
    
}