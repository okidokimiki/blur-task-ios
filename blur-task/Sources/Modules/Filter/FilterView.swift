import UIKit
import SnapKit

final class FilterView: BaseView {
    
    private lazy var flowLayout = UICollectionViewFlowLayout().do {
        $0.itemSize = .init(width: 150, height: 150)
        $0.scrollDirection = .vertical
    }
    
    private lazy var collectionView = BaseCollectionView(frame: .zero, collectionViewLayout: flowLayout).do {
        $0.backgroundColor = .red
        $0.delegate = self
        $0.dataSource = self
        $0.showsVerticalScrollIndicator = false
        $0.register(BaseCollectionViewCell.self)
    }
    
    override func setup() {
        super.setup()
        backgroundColor = .background
    }
    
    override func layout() {
        super.layout()
        addSubviews(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension FilterView: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension FilterView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(cellType: BaseCollectionViewCell.self, for: indexPath)
        cell.backgroundColor = .blue
        
        return cell
    }
}
