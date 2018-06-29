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
    let headerId = "headerId"

    var featureApp: FeatureApp?
    var appCategories: [Category]?
    var presenter: FeaturedAppsPresenter!

    override func viewDidLoad() {
        navigationItem.title = "Feature Apps"
        super.viewDidLoad()
        presenter.getFeaturedCategories { result, _ in
            self.featureApp = result
            self.appCategories = result?.appCategories
            performUIUpdatesOnMain {
                self.collectionView?.reloadData()
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        collectionView?.register(HeaderCell.self,
                                 forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                 withReuseIdentifier: headerId)
    }

    func showDetailAppController(app: App) {
        let appDetailController = DetailAppController()
        appDetailController.app = app
        navigationController?.pushViewController(appDetailController, animated: true)
    }

    // MARK: HEADER

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout,
                        referenceSizeForHeaderInSection _: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: headerId,
                                                                           for: indexPath) as? HeaderCell else {
            return UICollectionReusableView()
        }
        header.category = featureApp?.bannerCategory
        return header
    }

    // MARK: Cells

    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId,
                                                                for: indexPath) as? LargeCategoryCell else {
                return UICollectionViewCell()
            }
            cell.category = appCategories?[indexPath.item]
            cell.featureAppsViewController = self
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                            for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        cell.category = appCategories?[indexPath.item]
        cell.featureAppsViewController = self
        return cell
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 160)
        }
        return CGSize(width: view.frame.width, height: 230)
    }
}
