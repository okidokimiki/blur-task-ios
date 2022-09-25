import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) { subviews.forEach { addSubview($0) } }
    func addSubviews(_ subviews: UIView...) { subviews.forEach { addSubview($0) } }
}

