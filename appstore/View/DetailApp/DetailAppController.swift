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
    var mainView: DetailAppView {return self.view as! DetailAppView}
    var mainSource : DetailAppSource?

    
    var app : App?{
        didSet{
            navigationItem.title = app?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = DetailAppView(frame: UIScreen.main.bounds)
        self.mainSource = DetailAppSource(collection: mainView.appsCollectionView, app: app!)
        mainView.appsCollectionView.delegate = mainSource
        mainView.appsCollectionView.dataSource = mainSource
        mainView.appsCollectionView.register(DetailHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: detailHeaderId)
         mainView.appsCollectionView.register(DetailHeaderCell.self, forCellWithReuseIdentifier: detailHeaderId)

    }
}
