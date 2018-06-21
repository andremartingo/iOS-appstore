//
//  DetailAppController.swift
//  appstore
//
//  Created by André Martingo on 20/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class DetailAppController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    private let detailHeaderId = "detailHeaderId"
    
    var app : App?{
        didSet{
            navigationItem.title = app?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(DetailHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: detailHeaderId)
    }
    
    //MARK: HEADER
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: detailHeaderId, for: indexPath) as! DetailHeaderCell
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
}
