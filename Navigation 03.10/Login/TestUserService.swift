//
//  TestUserService.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 05.03.2023.
//

import UIKit

class TestUserService:UserService{
    var user = User(login: "7", fullName: "Kostenko", avatar: UIImage(named: "first"), status: "study")
    
    func service(login: String, password: String) -> Bool? {
        if login == user.login{
            return true
        } else {
            return false
        }
    }
    }



