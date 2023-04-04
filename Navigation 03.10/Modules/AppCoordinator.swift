//
//  Tapbar.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 28.03.2023.
//

import UIKit

final class TapBar: TabCoordinatable{
    
    var childCoordinators: [TabCoordinatable] = []
    var firstTapBarController:UINavigationController!
    var secondTapBarController:UINavigationController!
    var tapBarController:UITabBarController!
    
    init(firstTapBarController: UINavigationController!, secondTapBarController: UINavigationController!, tapBarController: UITabBarController!) {
        self.firstTapBarController = firstTapBarController
        self.secondTapBarController = secondTapBarController
        self.tapBarController = tapBarController
    }
    
    func start() -> UITabBarController {
        let item1 = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc"), tag: 0)
        let item2 = UITabBarItem(title: "Профиль", image: UIImage(systemName: "paperplane"), tag: 1)
        firstTapBarController.tabBarItem = item1
        secondTapBarController.tabBarItem = item2
        let appTap = AppTabBarController(viewControllers: [firstTapBarController, secondTapBarController])
        tapBarController.viewControllers = [firstTapBarController, secondTapBarController]
        UITabBar.appearance().backgroundColor = .lightText
        return appTap

                }
    
    func addChildCoordinator(_ coordinator: TabCoordinatable) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: TabCoordinatable) {
        childCoordinators = childCoordinators.filter { $0 === coordinator }
    }

    }

