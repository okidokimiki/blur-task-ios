import UIKit

extension UICollectionReusableView: ReuseIdentifiable, NibLoadableView { }

extension UICollectionView {
    
    func register<Cell: UICollectionViewCell>(_: Cell.Type) {
        register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func registerXib<Cell: UICollectionViewCell>(_: Cell.Type) {
        let bundle = Bundle(for: Cell.self)
        let nib = UINib(nibName: Cell.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }
    
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
}

extension UICollectionView {
    
    func register<View: UICollectionReusableView>(_: View.Type, with kind: String) {
        guard case UICollectionView.elementKindSectionHeader = kind,
              case UICollectionView.elementKindSectionFooter = kind else {
            fatalError(
                "Can't register a view with identifier \(View.reuseIdentifier) matching type \(View.self). "
                    + "Check that the kind of supplementary view is available"
            )
        }
        
        register(View.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: View.reuseIdentifier)
    }
    
    func registerXib<View: UICollectionReusableView>(_: View.Type, with kind: String) {
        guard case UICollectionView.elementKindSectionHeader = kind,
              case UICollectionView.elementKindSectionFooter = kind else {
            fatalError(
                "Can't register a view with identifier \(View.reuseIdentifier) matching type \(View.self). "
                    + "Check that the kind of supplementary view is available"
            )
        }
        
        let bundle = Bundle(for: View.self)
        let nib = UINib(nibName: View.nibName, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: View.reuseIdentifier)
    }
    
    func dequeueView<View: UICollectionReusableView>(for indexPath: IndexPath, with kind: String) -> View {
        guard case UICollectionView.elementKindSectionHeader = kind,
              case UICollectionView.elementKindSectionFooter = kind else {
            fatalError("Can't define a kind of section. Check that the kind of supplementary view is available")
        }
                
        guard let view = dequeueReusableSupplementaryView(ofKind: kind,
                                                          withReuseIdentifier: View.reuseIdentifier,
                                                          for: indexPath) as? View else {
            fatalError(
                "Can't dequeue a view with identifier \(View.reuseIdentifier) matching type \(View.self)"
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
        
        return view
    }
}
