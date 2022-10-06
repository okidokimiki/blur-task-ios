import UIKit

extension UICollectionView {
    
    func register<Cell: UICollectionViewCell>(_: Cell.Type) {
        register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func register<View: UICollectionReusableView>(_: View.Type, with kind: String) {
        register(View.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: View.reuseIdentifier)
    }
}
