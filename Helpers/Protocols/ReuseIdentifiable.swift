import UIKit

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable where Self: UIView {
    static var reuseIdentifier: String { "\(self)" }
}
