import UIKit

extension UICollectionReusableView: ReuseIdentifiable { }

// MARK: - Cell Registration

extension UICollectionView {
    
    func dequeueCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            fatalError(
                "Can't dequeue a cell with identifier \(Cell.reuseIdentifier) matching type \(Cell.self). "
                + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                + "and that you registered the cell beforehand"
            )
        }
        
        return cell
    }
    
    func register<Cell: UICollectionViewCell>(_ cellTypes: Cell.Type...) {
        cellTypes.forEach { register($0, forCellWithReuseIdentifier: $0.reuseIdentifier) }
    }
    
    func registerXib<Cell: UICollectionViewCell>(_ cellTypes: Cell.Type..., bundle: Bundle? = nil) {
        cellTypes.forEach {
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: bundle)
            register(nib, forCellWithReuseIdentifier: $0.reuseIdentifier)
        }
    }
}

// MARK: - Supplementary View Registration

extension UICollectionView {
    
    func dequeueView<View: UICollectionReusableView>(for indexPath: IndexPath) -> View {
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                          withReuseIdentifier: View.reuseIdentifier,
                                                          for: indexPath) as? View else {
            fatalError("Can't dequeue a view with identifier \(View.reuseIdentifier) matching type \(View.self)")
        }
        
        return view
    }
    
    func register<View: UITableViewHeaderFooterView>(_ viewTypes: View.Type...) {
        viewTypes.forEach { register($0.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                     withReuseIdentifier: $0.reuseIdentifier) }
    }
}
