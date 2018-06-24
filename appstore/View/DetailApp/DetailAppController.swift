//
//  DetailAppController.swift
//  appstore
//
//  Created by André Martingo on 20/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class DetailAppController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    private let detailHeaderId = "detailHeaderId"
    var mainView: DetailAppView {return self.view as! DetailAppView}

    
    var app : App?{
        didSet{
            navigationItem.title = app?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = DetailAppView(frame: UIScreen.main.bounds)
        mainView.appsCollectionView.delegate = self
        mainView.appsCollectionView.dataSource = self
        mainView.appsCollectionView.register(DetailHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: detailHeaderId)
         mainView.appsCollectionView.register(DetailHeaderCell.self, forCellWithReuseIdentifier: detailHeaderId)

    }
    
    //MARK: HEADER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = mainView.appsCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: detailHeaderId, for: indexPath) as! DetailHeaderCell
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    
    //MARK: BODY
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.appsCollectionView.dequeueReusableCell(withReuseIdentifier: detailHeaderId, for: indexPath) as! DetailHeaderCell
        return cell
    }
    
}
