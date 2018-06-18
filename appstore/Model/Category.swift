//
//  Category.swift
//  appstore
//
//  Created by André Martingo on 18/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var name: String?
    var apps: [App]?
}

//extension Category {
//    
//    static func sample() -> [Category] {
//        let bestNewAppsCategory = Category()
//        bestNewAppsCategory.name = "Best New Apps"
//        
//        var apps = [App]()
//
//        let fronzenApp = App()
//        fronzenApp.name = "Disney Build it: Frozen"
//        fronzenApp.imageName = "frozen"
//        fronzenApp.category = "Entertainment"
//        fronzenApp.price = NSNumber(value: 3.99)
//        
//        apps.append(fronzenApp)
//        
//        bestNewAppsCategory.apps = apps
//        
//        let bestNewGamesCategory = Category()
//        bestNewGamesCategory.name = "Best New Games"
//        
//        var games = [App]()
//        
//        let telePaint = App()
//        telePaint.name = "Telepaint"
//        telePaint.imageName = "telepaint"
//        telePaint.category = "Games"
//        telePaint.price = NSNumber(value: 2.99)
//        games.append(telePaint)
//    
//        bestNewGamesCategory.apps = games
//        
//        return [bestNewAppsCategory,bestNewGamesCategory]
//        
//    }
//}

