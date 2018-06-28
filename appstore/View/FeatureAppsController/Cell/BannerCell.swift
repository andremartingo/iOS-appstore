import UIKit

class BannerCell: AppCell {
    override func setupViews() {
        logoImageView.layer.cornerRadius = 0
        logoImageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        logoImageView.layer.borderWidth = 0.5
        logoImageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        addSubview(logoImageView)
        //Logo Constraints
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }

    override func populateViews() {
        if let imageName = app?.imageName {
            logoImageView.image = UIImage(named: imageName)
        }
    }
}
