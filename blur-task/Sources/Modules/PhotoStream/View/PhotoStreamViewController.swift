import UIKit

final class PhotoStreamViewController: BaseViewController<PhotoStreamView> {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarItems()
    }
}

// MARK: - NavigationBar

private extension PhotoStreamViewController {
    
    func setupNavigationBarItems() {
        lazy var leftLabel = UILabel().do {
            $0.text = "Filters"
            $0.textColor = .title
            $0.font = .boldSystemFont(ofSize: 35)
            $0.isEnabled = false
        }
        
        lazy var rightButton = UIButton().do {
            let height: CGFloat = 30
            $0.frame = .init(x: 0, y: 0, width: height, height: height)
            $0.layer.cornerRadius = height / 2
            $0.backgroundColor = .secondary
            $0.tintColor = .details
            $0.setImage(UI.SFSymbol.gearshapeFill, for: .normal)
        }
        
        navigationItem.leftBarButtonItem = .init(customView: leftLabel)
        navigationItem.rightBarButtonItem = .init(customView: rightButton)
    }
}

//#if DEBUG
//import SwiftUI
//
//struct ViewController_Preview: PreviewProvider {
//    static var previews: some View {
//        PhotoStreamViewController()
//            .showPreview()
//            .ignoresSafeArea(.all)
//    }
//}
//#endif
