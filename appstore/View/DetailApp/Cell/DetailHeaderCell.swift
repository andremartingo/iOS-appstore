import UIKit

class DetailHeaderCell: UICollectionViewCell {
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                logoImageView.image = UIImage(named: imageName)
            }
            if let name = app?.name {
                nameLabel.text = name
            }
            if let price = app?.price {
                buyButton.setTitle("$\(price)", for: .normal)
            }
        }
    }

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.red
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
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

    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BUY", for: .normal)
        button.layer.borderColor = UIColor(red: 0, green: 129 / 255, blue: 250 / 255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        addSubview(logoImageView)
        addSubview(segmentedController)
        addSubview(nameLabel)
        addSubview(buyButton)
        addSubview(dividerLine)
    }

    func setupConstraints() {
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        segmentedController.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8).isActive = true
        segmentedController.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        segmentedController.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                      constant: -40).isActive = true

        segmentedController.heightAnchor.constraint(equalToConstant: 34).isActive = true

        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        buyButton.bottomAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 0).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 60).isActive = true

        dividerLine.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerLine.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }
}
