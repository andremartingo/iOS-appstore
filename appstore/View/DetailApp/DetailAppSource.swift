//
//  DetailAppSource.swift
//  appstore
//
//  Created by André Martingo on 26/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit
import Foundation


class DetailAppSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    var collectionView: UICollectionView
    private let detailHeaderId = "detailHeaderId"
    
    var app: App

    
    init(collection: UICollectionView, app: App) {
        self.collectionView = collection
        self.app = app
    }
    
    //MARK: HEADER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: detailHeaderId, for: indexPath) as! DetailHeaderCell
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    
    
    //MARK: BODY
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailHeaderId, for: indexPath) as! DetailHeaderCell
        return cell
    }
}
