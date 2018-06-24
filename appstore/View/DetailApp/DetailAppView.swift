//
//  DetailAppView.swift
//  appstore
//
//  Created by André Martingo on 24/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class DetailAppView: UIView{
    
    private let detailHeaderId = "detailHeaderId"


    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        self.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    func setupViews() {
        addSubview(appsCollectionView)
    }
    
    func setupConstraints(){
        //CollectionView Constraints
        appsCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        appsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        appsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8).isActive = true
        appsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }

}
