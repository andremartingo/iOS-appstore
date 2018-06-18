//
//  APIRepository.swift
//  appstore
//
//  Created by André Martingo on 18/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import Foundation

class APIRepository {
    
    //ASK how to use repo pattern reutring [Category]
    func getFeaturedCategories() -> [Category] {
        var featuredCategories = [Category]()
        getFeaturedCategories { (categories, error ) in
            if let result = categories{
                featuredCategories = result
            }
        }
        return featuredCategories
    }
    
    
    func getFeaturedCategories(_ completionHandlergetFeaturedCategories: @escaping (_ result: [Category]?, _ error: NSError?) -> Void){
        let url :String = "https://api.letsbuildthatapp.com/appstore/featured"
        var categories = [Category]()
        URLSession.shared.dataTask(with: URL(string: url)!){ (data,response,error) -> Void in
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                print("There was an error with your request: \(error!)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                print("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
                for object in json["categories"] as! [[String: AnyObject]]{
                    let category = Category()
                    category.setValuesForKeys(object)
                    category.name = object["name"] as! String 
                    categories.append(category)
                }
                completionHandlergetFeaturedCategories(categories, nil)
            }
            catch let err{
                print(err)
            }
        }.resume()
    }
    
//    func getFeaturedCategories() -> [Category] {
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
//    }
}
