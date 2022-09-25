import UIKit

extension UITableViewCell: ReuseIdentifiable { }

extension UITableViewHeaderFooterView: ReuseIdentifiable { }

// MARK: - Cell Registration

extension UITableView {
    
    func dequeueCell<Cell: UITableViewCell>(cellType: Cell.Type) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier) as? Cell else {
            fatalError(
                "Can't dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
        
        return cell
    }

    func register<Cell: UITableViewCell>(_ cellTypes: Cell.Type...) {
        cellTypes.forEach { register($0, forCellReuseIdentifier: $0.reuseIdentifier) }
    }

    func registerXib<Cell: UITableViewCell>(_ cellTypes: Cell.Type..., bundle: Bundle? = nil) {
        cellTypes.forEach {
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: bundle)
            register(nib, forCellReuseIdentifier: $0.reuseIdentifier)
        }
    }
}

// MARK: - Supplementary View Registration

extension UITableView {
    
    func dequeueCell<View: UITableViewHeaderFooterView>(viewType: View.Type) -> View {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? View else {
            fatalError(
                "Can't dequeue a header/footer view with identifier \(viewType.reuseIdentifier) matching type \(viewType.self)"
            )
        }
        
        return view
    }
    
    func register<View: UITableViewHeaderFooterView>(_ viewTypes: View.Type...) {
        viewTypes.forEach { register($0, forHeaderFooterViewReuseIdentifier: $0.reuseIdentifier) }
    }
    
    func registerXib<View: UITableViewHeaderFooterView>(_ viewTypes: View.Type..., bundle: Bundle? = nil) {
        viewTypes.forEach {
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: bundle)
            register(nib, forHeaderFooterViewReuseIdentifier: $0.reuseIdentifier)
        }
    }
}
