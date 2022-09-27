import UIKit

extension UITableViewCell: ReuseIdentifiable, NibLoadableView { }

extension UITableView {
    
    func register<Cell: UITableViewCell>(_: Cell.Type) {
        register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func registerXib<Cell: UITableViewCell>(_: Cell.Type) {
        let bundle = Bundle(for: Cell.self)
        let nib = UINib(nibName: Cell.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func dequeueCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            fatalError(
                "Can't dequeue a cell with identifier \(Cell.reuseIdentifier) matching type \(Cell.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }

        return cell

    }
}

extension UITableViewHeaderFooterView: ReuseIdentifiable, NibLoadableView { }

extension UITableView {
    
    func register<View: UITableViewHeaderFooterView>(_: View.Type) {
        register(View.self, forHeaderFooterViewReuseIdentifier: View.reuseIdentifier)
    }
    
    func registerXib<View: UITableViewHeaderFooterView>(_: View.Type) {
        let bundle = Bundle(for: View.self)
        let nib = UINib(nibName: View.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: View.reuseIdentifier)
    }
    
    func dequeueCell<View: UITableViewHeaderFooterView>() -> View {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: View.reuseIdentifier) as? View else {
            fatalError(
                "Can't dequeue a header/footer view with identifier \(View.reuseIdentifier) matching type \(View.self)"
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the view beforehand"
            )
        }
        
        return view
    }
}
