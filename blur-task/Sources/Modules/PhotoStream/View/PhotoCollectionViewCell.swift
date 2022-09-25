import UIKit

final class PhotoCollectionViewCell: BaseCollectionViewCell {
    
    private lazy var imageView = UIImageView().do {
        $0.contentMode = .scaleAspectFit
    }
    
    override func setup() {
        super.setup()
        backgroundColor = .blue
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
