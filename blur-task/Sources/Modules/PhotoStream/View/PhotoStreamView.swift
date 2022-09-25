import UIKit
import SnapKit

final class PhotoStreamView: BaseView {
    
    #warning("Это должно быть в viewModel")
    private var photos: [Photo] = Photo.allPhotos()
    
    private lazy var flowLayout = UICollectionViewFlowLayout().do {
        $0.itemSize = .init(width: 150, height: 150)
        $0.scrollDirection = .vertical
    }
    
    private lazy var collectionView = BaseCollectionView(frame: .zero, collectionViewLayout: PinterestLayout()).do {
        if let layout = $0.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        $0.backgroundColor = .red
        $0.delegate = self
        $0.dataSource = self
        $0.showsVerticalScrollIndicator = false
        $0.register(PhotoCollectionViewCell.self)
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

extension PhotoStreamView: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension PhotoStreamView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(cellType: PhotoCollectionViewCell.self, for: indexPath)
        cell.configure(with: photos[indexPath.item])
        
        return cell
    }
}

// MARK: - PinterestLayoutDelegate

extension PhotoStreamView: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        guard let image = photos[indexPath.item].image else { return 0 }
        
        return image.size.height
    }
}
