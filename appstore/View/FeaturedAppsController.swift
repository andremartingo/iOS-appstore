//
//  ViewController.swift
//  appstore
//
//  Created by André Martingo on 11/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let largeCellId = "largeCellId"
    
    
    var appCategories: [Category]?
    var presenter: FeaturedAppsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getFeaturedCategories { (categories, error) in
            self.appCategories = categories
            performUIUpdatesOnMain{
                self.collectionView?.reloadData()
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView?.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count{
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.item == 2 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeCategoryCell
//            cell.category = appCategories?[indexPath.item]
//            return cell
//            
//        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.category = appCategories?[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.item == 2){
            return CGSize(width: view.frame.width, height: 160 )
        }
        return CGSize(width: view.frame.width, height: 230)
    }
}

