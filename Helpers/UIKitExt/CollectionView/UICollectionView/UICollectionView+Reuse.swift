import UIKit

extension UICollectionView {
    
    func reuse<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as! Cell
    }
    
    func reuse<View: UICollectionReusableView>(for indexPath: IndexPath, with kind: String) -> View {
        dequeueReusableSupplementaryView(ofKind: kind,
                                         withReuseIdentifier: View.reuseIdentifier,
                                         for: indexPath) as! View
    }
}
