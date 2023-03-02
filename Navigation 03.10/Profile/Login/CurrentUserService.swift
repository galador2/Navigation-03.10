//
//  CurrentUserService.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 01.03.2023.
//

import UIKit

class CurrentUserService:UserService{
    
    private let container = User()
    
    func service<login>(_service: login.Type) -> User? {
        
//        guard let service = container.loginUs(login.Type.self) else{
//            fatalError()
//        }
//        return container
        if login.Type.self != nil{
            _ = container.loginUs
        }
        return container
        
    }
    
    
    
}
