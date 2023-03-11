//
//  Checker.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 07.03.2023.
//

import UIKit

class Checker{
    
    static let shared = Checker()
    private init(){
        login = "777"
        password = "777"
        
    }
    let login:String
    let password:String
    
     func check(login:String, password:String) -> Bool{
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
