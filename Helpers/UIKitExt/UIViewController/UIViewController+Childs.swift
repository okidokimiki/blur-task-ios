import UIKit

extension UIViewController {
    func addChilds(_ childControllers: UIViewController...) { childControllers.forEach(addChild) }
}
