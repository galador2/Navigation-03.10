//
//  Module.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 28.03.2023.
//

import UIKit

protocol TabCoordinatable: AnyObject{
    
    var childCoordinators:[TabCoordinatable] {get}
    func start()->UITabBarController
    func addChildCoordinator(_ coordinator:TabCoordinatable)
    func removeChildCoordinator(_ coordinator:TabCoordinatable)
    
}

extension TabCoordinatable {
    func addChildCoordinator(_ coordinator: TabCoordinatable) {}
    func removeChildCoordinator(_ coordinator: TabCoordinatable) {}
}
