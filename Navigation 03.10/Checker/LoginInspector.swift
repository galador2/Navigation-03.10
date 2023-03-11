//
//  LoginInspector.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 07.03.2023.
//

import UIKit

struct LoginInspector: LoginViewControllerDelegate{
    func check(login: String, password: String)->Bool {
        let checker = Checker.shared
        print("CHECK")
        return check(login: login, password: password)
    }
    
}
    

