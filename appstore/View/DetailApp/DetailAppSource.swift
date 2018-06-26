//
//  DetailAppSource.swift
//  appstore
//
//  Created by André Martingo on 26/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit
import Foundation

class DetailAppSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let collectionView: UICollectionView

    private let detailHeaderId = "detailHeaderId"

    let app: App

    init(collection: UICollectionView, app: App) {
        self.collectionView = collection
        self.app = app
        super.init()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(DetailHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: detailHeaderId)
        self.collectionView.register(DetailHeaderCell.self, forCellWithReuseIdentifier: detailHeaderId)

    }

    // MARK: HEADER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: detailHeaderId, for: indexPath) as? DetailHeaderCell else {
            return UICollectionReusableView()
        }
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: detailHeaderId, for: indexPath) as! DetailHeaderCell
        header.app = app
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }

    // MARK: BODY
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailHeaderId, for: indexPath) as? DetailHeaderCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
