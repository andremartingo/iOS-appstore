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
            guard let imageName = app?.imageName else {
                return assertionFailure()
            }
            guard let name = app?.name else {
                return assertionFailure()
            }

            logoImageView.image = UIImage(named: imageName)
            nameLabel.text = name
        }
    }

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let segmentedController: UISegmentedControl = {
        let segmentedController = UISegmentedControl(items: ["Details", "Reviews", "Related"])
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        segmentedController.tintColor = UIColor.darkGray
        segmentedController.selectedSegmentIndex = 0
        return segmentedController
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(segmentedController)
        addSubview(nameLabel)
    }

    func setupConstraints() {
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        segmentedController.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8).isActive = true
        segmentedController.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        segmentedController.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        segmentedController.heightAnchor.constraint(equalToConstant: 34).isActive = true

        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }
}
