//
//  SceneDelegate.swift
//  HW_110
//
//  Created by Давид Васильев on 10.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
      static var shared: SceneDelegate?
      var navigationController: UINavigationController?
      func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
          guard let windowScene = (scene as? UIWindowScene) else { return }
          navigationController = UINavigationController(rootViewController: StartScreenViewController())
          navigationController?.isNavigationBarHidden = true
          self.window = UIWindow(windowScene: windowScene)
          self.window?.rootViewController = navigationController
          self.window?.makeKeyAndVisible()
            guard let windowScene = (scene as? UIWindowScene) else { return }
                   self.window = UIWindow(windowScene: windowScene)

                   let startScreenController = StartScreenViewController()
                    let authorizationController = startScreenController.authorizationController
                   if UserDefaults.standard.bool(forKey: "isUserLogged") {
                       guard let userId = UserDefaults.standard.string(forKey: "loggedInUser") else {return}
                       guard let user = CoreDataManager.shared.obtainAllUsers().first(where: {$0.id?.uuidString == userId}) else { return }
                       authorizationController.setUpTabBar(user: user)
                   } else {
                       let navigationController = UINavigationController(rootViewController: startScreenController)
                       navigationController.isNavigationBarHidden = true
                       self.window?.rootViewController = navigationController
                       self.window?.makeKeyAndVisible()
                   }
      }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene 
        // The scene may re-connect later
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        CoreDataManager.shared.saveContext()
    }
}
