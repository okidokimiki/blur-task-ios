import UIKit

class BaseViewController<View: UIView>: UIViewController {
    
    /// A way to access the `view` of your `viewController`
    func view() -> View {
        guard let castedView = view as? View else {
            fatalError("Can`t match view with type \(View.self)")
        }
        
        return castedView
    }
    
    override func loadView() {
        view = View()
    }
}
