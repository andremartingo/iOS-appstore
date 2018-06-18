//
//  Category.swift
//  appstore
//
//  Created by André Martingo on 18/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    @objc
    var type: String?
    @objc
    var name: String?
    @objc
    var apps: [App]?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            apps = [App]()
            for object in value as! [[String:Any]]{
                let app = App()
                app.setValuesForKeys(object)
                apps?.append(app)
            }
        }
    }
}