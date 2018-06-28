import UIKit

class ScreenshotImageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let screenshotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.clear
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    func setupViews() {
        addSubview(screenshotImageView)
    }

    func setupConstraints() {
        screenshotImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        screenshotImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        screenshotImageView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        screenshotImageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }
}
