//
//  UserService.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 01.03.2023.
//

import UIKit

protocol UserService{
    
    func service(login:String, password:String) -> Bool?
}

