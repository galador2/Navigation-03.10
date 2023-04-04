//
//  ProfileCoordinatable.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 30.03.2023.
//

import UIKit

protocol ProfileCoordinatable: AnyObject{
    
    var childCoordinators:[ProfileCoordinatable] {get}
    func start()->UIViewController

}
