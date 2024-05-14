//
//  SceneDelegate.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 4/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create a UIWindow instance
        let window = UIWindow(windowScene: windowScene)
        
        // Initialize the root view controller with a UINavigationController containing ArticlesListViewController
        let layout = UICollectionViewFlowLayout() // Create a layout object
        let articlesListViewController = ArticlesListViewController(collectionViewLayout: layout) // Initialize with layout
        let navigationController = UINavigationController(rootViewController: articlesListViewController)
        
        // Set the root view controller for the window and make it visible
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        // Assign the window to the SceneDelegate's window property
        self.window = window
    }
}


