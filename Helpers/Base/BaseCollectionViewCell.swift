import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
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
    
    /// Customize your collection view cell here
    func setup() { }
    
    /// Add and Layout your subviews here
    func layout() { }
}
