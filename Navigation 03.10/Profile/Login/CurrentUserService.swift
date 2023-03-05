//
//  CurrentUserService.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 01.03.2023.
//

import UIKit

class CurrentUserService:UserService{
    var user = User(loginUser: "2", fullName: "Kirill", avatar: UIImage(named: "KirKost"), status: "busy")
    
    func service(login: String) -> User? {
        if login == user.loginUser{
            return user
        } else{
            return nil
        }
    }

    
    
}
