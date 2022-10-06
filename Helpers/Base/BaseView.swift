import UIKit

class BaseView: UIView {
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialize() {
        setUpConfig()
        addSubviews()
        setUpConstraints()
    }
    
    /// Customize your view here
    func setUpConfig() { }
    
    /// Add your subviews here
    func addSubviews() { }
    
    /// Layout constraints your subviews here
    func setUpConstraints() { }
}
