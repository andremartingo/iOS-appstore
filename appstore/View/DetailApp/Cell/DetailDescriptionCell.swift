import UIKit
class DetailDescriptionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var desc: String? {
        didSet {
            descriptionTextView.attributedText = descriptionAttributedText()
        }
    }

    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "SAMPLE DESCRIPTION"
        return textView
    }()

    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    func setupViews() {
        addSubview(descriptionTextView)
        addSubview(dividerLine)
    }

    func setupConstraints() {
        descriptionTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true

        dividerLine.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 5).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerLine.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }

    private func descriptionAttributedText() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Description\n",
                                                       attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let range = NSRange(location: 0, length: attributedText.string.count)
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: range)
        guard let description = self.desc else {
            return attributedText
        }
        attributedText.append(NSAttributedString(string: description,
                                                 attributes: [
                                                     NSAttributedStringKey.font: UIFont.systemFont(ofSize: 11),
                                                     NSAttributedStringKey.foregroundColor: UIColor.darkGray
        ]))
        return attributedText
    }
}
