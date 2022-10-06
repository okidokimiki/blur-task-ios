import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialize() {
        setUpConfig()
        addSubviews()
        setUpConstraints()
    }
    
    /// Customize your table view cell here
    func setUpConfig() {
        selectionStyle = .none
    }
    
    /// Add your subviews here
    func addSubviews() { }
    
    /// Layout constraints your subviews here
    func setUpConstraints() { }
}
