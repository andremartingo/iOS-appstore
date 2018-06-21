//
//  HeaderCell.swift
//  appstore
//
//  Created by André Martingo on 20/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class DetailHeaderCell: UICollectionViewCell {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = UIColor.red
        addSubview(logoImageView)
    }
}
