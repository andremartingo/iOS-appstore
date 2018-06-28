//
//  AppDelegate.swift
//  appstore
//
//  Created by André Martingo on 11/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let layout = UICollectionViewFlowLayout()
        let featuredAppsController = FeaturedAppsController(collectionViewLayout: layout)
        let presenter = FeaturedAppsPresenter(repository: APIRepository())
        featuredAppsController.presenter = presenter
        window?.rootViewController = UINavigationController(rootViewController: featuredAppsController)
        // Override point for customization after application launch.
        return true
    }
}
