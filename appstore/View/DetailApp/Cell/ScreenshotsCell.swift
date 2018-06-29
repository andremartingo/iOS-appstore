import UIKit

class ScreenshotsCell: UICollectionViewCell, UICollectionViewDelegate,
    UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let cellId = "cellId"

    var images: [String]? {
        didSet {
            performUIUpdatesOnMain {
                self.appsCollectionView.reloadData()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    func setupViews() {
        addSubview(appsCollectionView)
        addSubview(dividerLine)
        appsCollectionView.register(ScreenshotImageCell.self, forCellWithReuseIdentifier: cellId)
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
    }

    func setupConstraints() {
        // CollectionView Constraints
        appsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        appsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        appsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        appsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true

        dividerLine.topAnchor.constraint(equalTo: appsCollectionView.bottomAnchor, constant: 5).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerLine.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        guard let items = self.images?.count else {
            return 0
        }
        return items
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                            for: indexPath) as? ScreenshotImageCell
        else {
            return UICollectionViewCell()
        }
        guard let imageName = images?[indexPath.row] else {
            return cell
        }
        cell.screenshotImageView.image = UIImage(named: imageName)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout _: UICollectionViewLayout,
                        sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: 240, height: collectionView.frame.height - 28)
    }
}
