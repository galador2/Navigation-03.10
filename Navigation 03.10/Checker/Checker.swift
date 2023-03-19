//
//  Checker.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 07.03.2023.
//

import UIKit

final class Checker{
    
    static var shared = Checker()
    #if DEBUG
      private var login = ""
      private var  password = ""
    #else
    private var login = ""
    private var  password = ""
    
    #endif
    private init(){}
    
     func check(login:String, password:String) -> Bool{
         if login == self.login && password == self.password {
             return true
         }
         return false
    }
}
