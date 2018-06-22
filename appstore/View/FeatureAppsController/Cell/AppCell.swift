//
//  AppCell.swift
//  appstore
//
//  Created by André Martingo on 18/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }

    var app: App?{
        didSet{
            populateViews()
        }
    }
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "frozen")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label =  UILabel()
        label.text = "Disney Build It: Frozen"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameHeightConstraint: NSLayoutConstraint?
    
    let categoryLabel: UILabel = {
        let label =  UILabel()
        label.text = "Entertainment"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label =  UILabel()
        label.text = "$3.99"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(logoImageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
                
        //Logo Constraints
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: frame.width).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        //NameLabel Constraints
        nameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 2).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        self.nameHeightConstraint = nameLabel.heightAnchor.constraint(equalToConstant: 40)
        nameLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        //Category Constraints
        categoryLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 38).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        categoryLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        //Price Constraints
        priceLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 56).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }
    
    
    func populateViews() {
        if let name = app?.name{
            nameLabel.text = name
            
            let rect = NSString(string: name).boundingRect(with: CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
            //If rect.height > 20 = Two Lines Description
            if rect.height > 20 {
                categoryLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 38).isActive = true
                priceLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 56).isActive = true
            } else {
                nameHeightConstraint?.constant = 20
                categoryLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 22).isActive = true
                priceLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40).isActive = true
            }
        }
        
        categoryLabel.text = app?.category
        
        if let price = app?.price{
            priceLabel.text = "$\(price)"
        } else {
            priceLabel.text = ""
        }
        
        if let imageName = app?.imageName{
            logoImageView.image = UIImage(named: imageName)
        }
    }
    
    
}



