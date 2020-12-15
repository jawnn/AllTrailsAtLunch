import UIKit

class PaddedTextField: UITextField {

    var padding: UIEdgeInsets

    init(frame: CGRect, top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self.padding = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.borderColor = UIColor.systemGray3.cgColor

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
