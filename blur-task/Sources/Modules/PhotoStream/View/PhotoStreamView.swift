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
        $0.backgroundColor = .none
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
        addSubviews(photosCollectionView)
        photosCollectionView.snp.makeConstraints { make in
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
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        guard let image = photos[indexPath.item].image else { return .zero }
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: .infinity)
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect)
        return rect.size.height
    }
}

//#if DEBUG
//import SwiftUI
//
//struct View_Preview: PreviewProvider {
//    static var previews: some View {
//        PhotoStreamView()
//            .showPreview()
//            .ignoresSafeArea(.all)
//    }
//}
//#endif
