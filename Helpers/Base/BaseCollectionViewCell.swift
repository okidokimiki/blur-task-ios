import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    /// Customize your collection view cell here
    func setUpConfig() { }
    
    /// Add your subviews here
    func addSubviews() { }
    
    /// Layout constraints your subviews here
    func setUpConstraints() { }
}
