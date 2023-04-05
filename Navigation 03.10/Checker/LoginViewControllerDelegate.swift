//
//  LoginViewControllerDelegate.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 07.03.2023.
//

import UIKit

protocol LoginViewControllerDelegate{
    func check (login: String, password: String) -> Bool
}
