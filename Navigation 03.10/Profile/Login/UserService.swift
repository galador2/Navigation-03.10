//
//  UserService.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 01.03.2023.
//

import UIKit

protocol UserService{
    func service <login>(_service:login.Type) -> User?
}