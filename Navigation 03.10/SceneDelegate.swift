//
//  SceneDelegate.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: TapBar?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let tapBarController = UITabBarController()
        let loginVC = LogInViewController()
        let firstTapBarController = UINavigationController.init(rootViewController: FeedViewController())
        let secondTapBarController = UINavigationController.init(rootViewController: loginVC)
        let loginIspector = LoginInspector()
        loginVC.loginDelegate = loginIspector
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let appCoordinator = TapBar(firstTapBarController: firstTapBarController, secondTapBarController: secondTapBarController, tapBarController: tapBarController)
        self.appCoordinator = appCoordinator
        window.rootViewController = appCoordinator.start()
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

