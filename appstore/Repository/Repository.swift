//
//  Repository.swift
//  appstore
//
//  Created by André Martingo on 18/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//
import Foundation
protocol Repository {

    func getFeaturedCategories(_ completionHandlergetFeaturedCategories: @escaping (_ result: FeatureApp?, _ error: NSError?) -> Void)

      func getAppById(appId: NSNumber, _ completionHandlergetFeaturedCategories: @escaping (_ result: App?, _ error: NSError?) -> Void)
}
