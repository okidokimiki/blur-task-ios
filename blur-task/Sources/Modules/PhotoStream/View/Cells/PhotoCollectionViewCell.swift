import UIKit
import SnapKit

final class PhotoCollectionViewCell: BaseCollectionViewCell {
    
    private lazy var imageView = UIImageView().do {
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    
    override var isHighlighted: Bool {
        didSet { animateTransformCell(during: 0.15, dx: 1.05, dy: 1.05) }
    }
    
    override func layout() {
        super.layout()
        addSubviews(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func configure(with model: Photo) {
        imageView.image = model.image
    }
}
