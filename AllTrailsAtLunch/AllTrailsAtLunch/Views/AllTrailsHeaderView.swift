import UIKit

class AllTrailsHeaderView: UIView {

    let topStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let companyLogoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "AllTrailsLogo")
        return imageView
    }()

    let companyTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "at Lunch"
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.textColor = .systemGray4
        return label
    }()

    let bottomStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 6
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let filterButton: UIButton = {
        let button = UIButton(frame: .zero)
        let buttonTitle = NSAttributedString(string: "Filter", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium)])

        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray3.cgColor
        button.setTitleColor(.systemGray2, for: .normal)
        button.setAttributedTitle(buttonTitle, for: .normal)
        return button
    }()

    let searchTextField: PaddedTextField = {
        let textField = PaddedTextField(frame: .zero, left: 12)
        let placeholderAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        let placeholderText = NSAttributedString(string: "Search for a restaurant", attributes: placeholderAttributes)
        textField.attributedPlaceholder = placeholderText
        
        let button = UIButton()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        button.imageView?.tintColor = UIColor(named: "AllTrailsGreen")
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.addTarget(self, action: #selector(tappedSearch), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always

        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSelf()
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSelf() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureSubviews() {
        addSubview(topStackView)
        addSubview(bottomStackView)

        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: topAnchor, constant: UIApplication.shared.statusBarFrame.size.height + 4),

            bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 6),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])

        topStackView.addArrangedSubview(companyLogoImageView)
        companyLogoImageView.widthAnchor.constraint(equalToConstant: 144).isActive = true
        companyLogoImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        topStackView.addArrangedSubview(companyTitleLabel)

        bottomStackView.addArrangedSubview(filterButton)
        filterButton.widthAnchor.constraint(equalToConstant: 54).isActive = true
        filterButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        bottomStackView.addArrangedSubview(searchTextField)
    }

    @objc func tappedSearch() {

    }


}
