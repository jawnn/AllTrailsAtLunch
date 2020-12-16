import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }

    func applyShadow(shadowRadius: CGFloat, shadowOpacity: Float, shadowColor: CGColor, offSet: CGSize) {
        layer.masksToBounds = false
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowColor = shadowColor
        layer.shadowOffset = offSet
    }

}
