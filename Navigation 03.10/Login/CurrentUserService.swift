//
//  CurrentUserService.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 01.03.2023.
//

import UIKit

class CurrentUserService:UserService{
    var user = User(login: "7", fullName: "Kirill", avatar: UIImage(named: "KirKost"), status: "busy")
    
    func service(login: String, password: String) -> Bool? {
        if login == login{
           
            return true
        }
        else if password == password{
            
            return true
        }

        else{
            return false
        }
    }
    }

    
    

