//
//  CategoryCell.swift
//  appstore
//
//  Created by André Martingo on 11/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.blue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setupViews(){
        backgroundColor = UIColor.black
        addSubview(appsCollectionView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
    }
}
