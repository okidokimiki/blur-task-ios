import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        layout()
    }
    
    /// Customize your base view here
    func setup() { }
    
    /// Add and Layout your subviews here
    func layout() { }
}
