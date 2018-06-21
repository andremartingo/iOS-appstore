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
    
    var featureAppsViewController : FeaturedAppsController?
    
    var category: Category? {
        didSet{
            if let name = category?.name{
                sectionLabel.text = name
            }
            appsCollectionView.reloadData()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Properties
    
    let sectionLabel: UILabel = {
        let label =  UILabel()
        label.text = "Best New Apps"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Collection View Inside CategoryCell
    let appsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    let dividerLine : UIView = {
        let view = UIView()
                view.backgroundColor = UIColor(white: 0.4,alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews(){
        backgroundColor = UIColor.clear
        
        addSubview(sectionLabel)
        addSubview(appsCollectionView)
        addSubview(dividerLine)
        
        //SectionLabel Constraints
        sectionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        sectionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true

        sectionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sectionLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        //CollectionView Constraints
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: appCellId)
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        appsCollectionView.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 8).isActive = true
        appsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        appsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8).isActive = true
        appsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        //DividerLine Constraints
        dividerLine.topAnchor.constraint(equalTo: appsCollectionView.bottomAnchor, constant: 0).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerLine.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let items = category?.apps?.count{
            return items
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appCellId, for: indexPath) as! AppCell
        cell.app = category?.apps?[indexPath.item]
        return cell
    }
    
    //AppCell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height-30)
    }
    
    //Collection View Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = category?.apps?[indexPath.item] {
            featureAppsViewController?.showDetailAppController(app: app)
        }
    }
}






