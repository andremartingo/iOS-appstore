//
//  FeaturedAppsPresenter.swift
//  appstore
//
//  Created by André Martingo on 18/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import Foundation

class FeaturedAppsPresenter{
    
    var repository : Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func getFeaturedCategories() -> [Category]{
        return repository.getFeaturedCategories()
    }
}
