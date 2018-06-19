//
//  FeatureApp.swift
//  appstore
//
//  Created by André Martingo on 19/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class FeatureApp: NSObject {
    
    @objc
    var bannerCategory: Category?
    @objc
    var appCategories: [Category]?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "categories" {
            appCategories = [Category]()
            for object in value as! [[String:Any]]{
                let category = Category()
                category.setValuesForKeys(object)
                appCategories?.append(category)
            }
        } else if key == "bannerCategory"{
            bannerCategory = Category()
            bannerCategory?.setValuesForKeys(value as! [String:AnyObject])
        } else {
            super.setValue(value, forKey: key)
        }
    }

}
