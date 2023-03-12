//
//  SceneDelegate.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var firstTapBarController:UINavigationController!
    var secondTapBarController:UINavigationController!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let tapBarController = UITabBarController()
        firstTapBarController = UINavigationController.init(rootViewController: FeedViewController())
        secondTapBarController = UINavigationController.init(rootViewController: LogInViewController())
        let loginVC = LogInViewController()
        let loginIspector = LoginInspector()
        loginVC.loginDelegate = loginIspector
       // loginVC.loginDelegate = loginIspector
        //let loginController = UINavigationController(rootViewController: loginVC)
        tapBarController.viewControllers = [firstTapBarController,secondTapBarController]
        let item1 = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc"), tag: 0)
        let item2 = UITabBarItem(title: "Профиль", image: UIImage(systemName: "paperplane"), tag: 1)
        firstTapBarController.tabBarItem = item1
        secondTapBarController.tabBarItem = item2
        UITabBar.appearance().backgroundColor = .lightText
        let window = UIWindow(windowScene: windowScene)
        self.window = window
//        let loginVC = LogInViewController()
//        let loginIspector = LoginInspector()
//        loginVC.loginDelegate = loginIspector
//        let loginController = UINavigationController(rootViewController: loginVC)
//        let inspector = loginVC as? LoginInspector
        window.rootViewController = tapBarController
        window.makeKeyAndVisible()
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

