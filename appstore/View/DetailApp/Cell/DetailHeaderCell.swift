//
//  HeaderCell.swift
//  appstore
//
//  Created by André Martingo on 20/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class DetailHeaderCell: UICollectionViewCell {

    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                logoImageView.image = UIImage(named: imageName)
            }
        }
    }

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        addSubview(logoImageView)
    }

    func setupConstraints() {
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
