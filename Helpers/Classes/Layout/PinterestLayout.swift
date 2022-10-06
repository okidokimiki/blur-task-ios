/**
 * source web-site: https://www.raywenderlich.com/4829472-uicollectionview-custom-layout-tutorial-pinterest
 * github project: https://github.com/huydemi/Pinterest
 * awesome example: https://github.com/AZCoder2/Pinterest
 */

import UIKit

protocol PinterestLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
}

final class PinterestLayout: UICollectionViewLayout {
    
    weak var delegate: PinterestLayoutDelegate?
    
    private let numberOfColumns = 2
    private var cellPadding: CGFloat = 6
    private var contentHeight: CGFloat = 0
    
    private var cache: [UICollectionViewLayoutAttributes] = []
    
    convenience init(with cellPadding: CGFloat) {
        self.init()
        self.cellPadding = cellPadding
    }
    
    private var contentWidth: CGFloat {
        guard let collectionView else { return .zero }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard cache.isEmpty, let collectionView else { return }
        
        var xOffset: [CGFloat] = []
        var yOffset: [CGFloat] = .init(repeating: 0.0, count: numberOfColumns)
        var column = 0
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        (0..<numberOfColumns).forEach { xOffset.append(CGFloat($0) * columnWidth) }
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let photoWidth = columnWidth - cellPadding * 2
            let photoHeight = delegate?.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath, withWidth: photoWidth) ?? 180
            let cellHeight = cellPadding * 2 + photoHeight
            let frame: CGRect = .init(
                x: xOffset[column],
                y: yOffset[column],
                width: columnWidth,
                height: cellHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + cellHeight
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        for attributes in cache where attributes.frame.intersects(rect) {
            visibleLayoutAttributes.append(attributes)
        }
        
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        cache[indexPath.item]
    }
}
