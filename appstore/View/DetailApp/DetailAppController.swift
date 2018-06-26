//
//  DetailAppController.swift
//  appstore
//
//  Created by André Martingo on 20/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class DetailAppController: UIViewController {
    
    private let detailHeaderId = "detailHeaderId"
    var mainView: DetailAppView!
    var mainSource : DetailAppSource?

    
    var app : App?{
        didSet{
            navigationItem.title = app?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = DetailAppView(frame: UIScreen.main.bounds)
        view = mainView
        self.mainSource = DetailAppSource(collection: mainView.appsCollectionView, app: app!)
    }
}
