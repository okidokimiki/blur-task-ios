import UIKit

extension UITableView {
    
    func reuse<Cell: UITableViewCell>(indexPath: IndexPath) -> Cell {
        dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as! Cell
    }
    
    func reuse<View: UITableViewHeaderFooterView>() -> View {
        dequeueReusableHeaderFooterView(withIdentifier: View.reuseIdentifier) as! View
    }
}
