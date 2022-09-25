import UIKit

final class PhotoCollectionViewCell: BaseCollectionViewCell {
    
    private let imageView = UIImageView()
    
    override func setup() {
        super.setup()
        contentView.backgroundColor = .yellow
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
