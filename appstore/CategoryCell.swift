//
//  CategoryCell.swift
//  appstore
//
//  Created by André Martingo on 11/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    private let appCellId = "appCellId"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Collection View Inside CategoryCell
    let appsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setupViews(){
        backgroundColor = UIColor.clear
        
        addSubview(appsCollectionView)
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: appCellId)
        
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appCellId, for: indexPath) as! AppCell
        return cell
    }
 
    //AppCell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }
    
    //Collection View Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
}

class AppCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "frozen")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
    }
    
}








