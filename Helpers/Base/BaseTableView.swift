import UIKit

class BaseTableView: UITableView {
    
    init(style: UITableView.Style = .plain) {
        super.init(frame: .zero, style: style)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initialize() {
        setUpConfig()
    }
    
    /// Customize your table view here
    func setUpConfig() {
        separatorStyle = .none
    }
}
