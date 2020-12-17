import UIKit

class TransitionViewLayoutButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        configureButtonAttributes()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureButtonAttributes() {
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]
        let buttonTitle = NSAttributedString(string: "Map", attributes: attributes)
        self.setTitleColor(.white, for: .normal)
        self.setAttributedTitle(buttonTitle, for: .normal)

        self.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
        self.imageView?.tintColor = .white

        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor(named: "allTrailsGreen")
    }

}
