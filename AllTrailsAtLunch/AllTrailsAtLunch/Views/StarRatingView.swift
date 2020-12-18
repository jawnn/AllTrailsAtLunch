import UIKit

class StarRatingView: UIView {

    let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let reviewQuantityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func populateStackView(rating: Float, ratingQuantity: UInt) {
        let roundedRating = Int(rating.rounded())

        for (index, subView) in stackView.arrangedSubviews.enumerated() {
            if let starView = subView as? UIImageView {
                starView.image = UIImage(systemName: "star.fill")
                starView.tintColor = (index + 1) <= roundedRating ? .systemYellow : .systemGray
            }
            if let quantityLabel = subView as? UILabel {
                quantityLabel.text = "(\(ratingQuantity))"
            }
        }

    }

    private func configureStackView() {
        layoutStackViewSubviews()
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func layoutStackViewSubviews() {
        for _ in 1...5 {
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.tintColor = .systemGray
            imageView.image = UIImage(systemName: "star.fill")
            imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            stackView.addArrangedSubview(imageView)
        }
        stackView.addArrangedSubview(reviewQuantityLabel)
    }

    func resetStackView() {
        for subView in stackView.arrangedSubviews {
            if let imageView = subView as? UIImageView {
                imageView.image = nil
            }
            if let label = subView as? UILabel {
                label.text = ""
            }
        }
    }

}
