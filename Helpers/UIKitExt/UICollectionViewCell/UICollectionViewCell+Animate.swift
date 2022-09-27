import UIKit

extension UICollectionViewCell {
    
    func animateTransformCell(during timeInterval: TimeInterval, dx: CGFloat, dy: CGFloat) {
        UIView.animate(withDuration: timeInterval) {
            self.transform = self.isHighlighted ? .init(scaleX: dx, y: dy) : .identity
        }
    }
}
