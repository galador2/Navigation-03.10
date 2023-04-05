//
//  User.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 01.03.2023.
//

import UIKit

struct User{
    
        let login:String
        let fullName:String
        let avatar:UIImage?
        let status:String
    
    init(login: String, fullName: String, avatar: UIImage?, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }

    
}
