import UIKit

class BaseCollectionView: UICollectionView {
    
    /// You should use this initializer when you want to pass `UICollectionViewLayout` with custom params in initializer. Frame is `zero`
    convenience init(layout: UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: layout)
    }
    
    /// You should use this initializer when you want to pass `UICollectionViewLayout` with default initializer. Frame is `zero`
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
