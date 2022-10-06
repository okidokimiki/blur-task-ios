import UIKit
import SnapKit
import AVFoundation

final class PhotoStreamView: BaseView {
    
    #warning("Это должно быть в viewModel")
    private var photos: [Photo] = Photo.allPhotos()
    
    private lazy var photosCollectionView = BaseCollectionView(layout: PinterestLayout.self).do {
        if let layout = $0.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        $0.contentInset = .init(top: 0, left: 8, bottom: 0, right: 8)
        $0.backgroundColor = .none
        $0.delegate = self
        $0.dataSource = self
        $0.showsVerticalScrollIndicator = false
        $0.register(PhotoCollectionViewCell.self)
    }
    
    override func addSubviews() {
        super.addSubviews()
        addSubviews(photosCollectionView)
    }
    
    override func setUpConstraints() {
        photosCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension PhotoStreamView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        guard let indexPath = indexPaths.first else { return nil }
        
        let config = UIContextMenuConfiguration(actionProvider: { _ in
            let open = UIAction(
                title: "Open",
                image: UI.SFSymbol.link) { _ in
                    print("Did Tap open")
                }
            
            let faforite = UIAction(
                title: "Add to faforite",
                image: UI.SFSymbol.star) { _ in
                    print("Did Tap faforite")
                }
            
            let menu = UIMenu(
                title: self.photos[indexPath.item].name,
                children: [open, faforite]
            )
            
            return menu
        })
        
        return config
    }
}

// MARK: - UICollectionViewDataSource

extension PhotoStreamView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        cell.configure(with: photos[indexPath.item])
        
        return cell
    }
}

// MARK: - PinterestLayoutDelegate

extension PhotoStreamView: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        guard let image = photos[indexPath.item].image else { return .zero }
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: .infinity)
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect)
        return rect.size.height
    }
}
