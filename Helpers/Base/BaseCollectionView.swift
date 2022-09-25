import UIKit

class BaseCollectionView: UICollectionView {
    
    convenience init(layout: UICollectionViewLayout.Type) {
        self.init(frame: .zero, collectionViewLayout: layout.init())
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// Customize your collection view here
    func setup() { }
}
