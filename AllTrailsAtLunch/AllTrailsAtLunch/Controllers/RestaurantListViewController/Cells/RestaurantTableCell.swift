import UIKit

class RestaurantTableCell: UITableViewCell {

    let backgroundColorCellView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white

        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray4.cgColor
        view.layer.cornerRadius = 5

        view.applyShadow(
            shadowRadius: 4,
            shadowOpacity: 0.1,
            shadowColor: UIColor.systemGray2.cgColor,
            offSet: CGSize(width: 0 , height:2)
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let restaurantImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .checkmark
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let ratingView: StarRatingView = {
        let view = StarRatingView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let detailsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "$$$ - Supporting Text"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let favoriteButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.imageView?.tintColor = .systemGray2
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: String(describing: RestaurantTableCell.self))

        contentView.backgroundColor = UIColor(named: "rootBackgroundGray")
        addSubviewsToCell()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviewsToCell() {
        contentView.addSubview(backgroundColorCellView)
        backgroundColorCellView.addSubviews(
            restaurantImage, titleLabel, favoriteButton,
            ratingView,
            detailsLabel
        )
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            backgroundColorCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            backgroundColorCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            backgroundColorCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            backgroundColorCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),

            restaurantImage.topAnchor.constraint(equalTo: backgroundColorCellView.topAnchor, constant: 12),
            restaurantImage.leadingAnchor.constraint(equalTo: backgroundColorCellView.leadingAnchor, constant: 12),
            restaurantImage.bottomAnchor.constraint(equalTo: backgroundColorCellView.bottomAnchor, constant: -12),
            restaurantImage.widthAnchor.constraint(equalToConstant: 50),

            favoriteButton.topAnchor.constraint(equalTo: restaurantImage.topAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: backgroundColorCellView.trailingAnchor, constant: -12),

            titleLabel.topAnchor.constraint(equalTo: restaurantImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: restaurantImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: favoriteButton.leadingAnchor, constant: -12),

            ratingView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            ratingView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            ratingView.centerYAnchor.constraint(equalTo: restaurantImage.centerYAnchor),

            detailsLabel.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 4),
            detailsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            detailsLabel.bottomAnchor.constraint(equalTo: restaurantImage.bottomAnchor)

        ])
    }

}
