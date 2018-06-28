import Foundation
import UIKit

class DetailAppSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    let collectionView: UICollectionView

    private let detailHeaderId = "detailHeaderId"
    private let screenshotId = "screenshotId"
    private let detailId = "detailId"

    var app: App {
        didSet {
            performUIUpdatesOnMain {
                self.collectionView.reloadData()
            }
        }
    }

    init(collection: UICollectionView, app: App) {
        collectionView = collection
        self.app = app
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DetailHeaderCell.self,
                                forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                withReuseIdentifier: detailHeaderId)
        collectionView.register(ScreenshotsCell.self, forCellWithReuseIdentifier: screenshotId)
        collectionView.register(DetailDescriptionCell.self, forCellWithReuseIdentifier: detailId)
    }

    // MARK: HEADER

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: detailHeaderId,
                                                                           for: indexPath) as? DetailHeaderCell
        else {
            return UICollectionReusableView()
        }
        header.app = app
        return header
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout _: UICollectionViewLayout, referenceSizeForHeaderInSection _: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 170)
    }

    // MARK: BODY

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailId,
                                                                for: indexPath) as? DetailDescriptionCell else {
                return UICollectionViewCell()
            }
            cell.desc = app.desc
//            cell.descriptionTextView.attributedText = descriptionAttributedText()
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotId,
                                                            for: indexPath) as? ScreenshotsCell else {
            return UICollectionViewCell()
        }
        guard let image = app.screenshots else {
            return cell
        }
        cell.images = image
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }

//    private func descriptionAttributedText() -> NSAttributedString {
//        let attributedText = NSMutableAttributedString(string: "Description\n",
//                                                       attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
//        let style = NSMutableParagraphStyle()
//        style.lineSpacing = 10
//        let range = NSRange(location: 0, length: attributedText.string.count)
//        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: range)
//        guard let description = app.desc else {
//            return attributedText
//        }
//        attributedText.append(NSAttributedString(string: description,
//                                                 attributes: [
//                                                     NSAttributedStringKey.font: UIFont.systemFont(ofSize: 11),
//                                                     NSAttributedStringKey.foregroundColor: UIColor.darkGray
//        ]))
//        return attributedText
//    }
}
