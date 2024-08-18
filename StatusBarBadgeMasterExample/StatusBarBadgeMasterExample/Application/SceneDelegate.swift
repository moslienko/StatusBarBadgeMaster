//
//  SceneDelegate.swift
//  StatusBarBadgeMasterExample
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import StatusBarBadgeMaster
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
        
        let vc = MainViewController()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        
        window?.makeKeyAndVisible()

        AppStatusBarView(
            icon: UIImage(named: "apple_logo"),
            title: "App Title",
            config: AppStatusBarViewConfig()
        ).embedInWindows()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
