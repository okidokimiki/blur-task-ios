import UIKit

extension UITableView {
    
    func register<Cell: UITableViewCell>(_: Cell.Type) {
        register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func register<View: UITableViewHeaderFooterView>(_: View.Type) {
        register(View.self, forHeaderFooterViewReuseIdentifier: View.reuseIdentifier)
    }
}
