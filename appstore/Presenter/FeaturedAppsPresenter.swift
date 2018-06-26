//
//  FeaturedAppsPresenter.swift
//  appstore
//
//  Created by André Martingo on 18/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import Foundation

class FeaturedAppsPresenter {

    let repository: APIRepository

    init(repository: APIRepository) {
        self.repository = repository
    }

    func getFeaturedCategories(_ completionHandlergetFeaturedCategories: @escaping (_ result: FeatureApp?, _ error: NSError?) -> Void) {
        repository.getFeaturedCategories { (result, error) in
            completionHandlergetFeaturedCategories(result, error)
        }
    }
}
