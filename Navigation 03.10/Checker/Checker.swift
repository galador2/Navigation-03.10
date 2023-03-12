//
//  Checker.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 07.03.2023.
//

import UIKit

class Checker{
    
    static var shared = Checker()
    #if DEBUG
      private var login = "1"
      private var  password = "1"
    #else
    private var login = "1"
    private var  password = "1"
    
    #endif
    private init(){}
    
     func check(login:String, password:String) -> Bool{
         if login == self.login && password == self.password {
             return true
         }
         return false
    }
}

