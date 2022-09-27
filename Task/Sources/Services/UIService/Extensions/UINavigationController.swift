import UIKit

extension UINavigationController {
    static func translucentNavigationController() -> UINavigationController {
        UINavigationController().do {
            $0.navigationBar.setBackgroundImage(UIImage(), for: .default)
            $0.navigationBar.shadowImage = UIImage()
            $0.navigationBar.isTranslucent = true
            $0.view.backgroundColor = .clear
        }
    }
}
