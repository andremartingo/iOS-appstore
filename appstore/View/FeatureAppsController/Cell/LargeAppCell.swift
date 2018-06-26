//
//  LargeAppCell.swift
//  appstore
//
//  Created by André Martingo on 18/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

class LargeAppCell: AppCell {
    override func setupViews() {
        logoImageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        addSubview(logoImageView)
        //Logo Constraints
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }
}
