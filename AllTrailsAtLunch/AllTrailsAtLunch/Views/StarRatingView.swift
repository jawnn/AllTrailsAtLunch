import UIKit

class StarRatingView: UIView {

    let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 4
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

        for index in 0..<roundedRating {
            if let starView = stackView.arrangedSubviews[index] as? UIButton {
                starView.imageView?.tintColor = .systemYellow
            }
        }
        if let quantityLabel = stackView.arrangedSubviews.last as? UILabel {
            quantityLabel.text = "(\(ratingQuantity))"
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
            let button = UIButton(frame: .zero)
            button.imageView?.tintColor = .systemGray
            button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            stackView.addArrangedSubview(button)
        }
        stackView.addArrangedSubview(reviewQuantityLabel)
    }

}
