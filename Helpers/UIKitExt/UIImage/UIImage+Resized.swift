import UIKit

extension UIImage {
    
    /// Resizes an image.
    /// - Parameters:
    ///   - size: New size.
    /// - Returns: Resized image.
    ///
    /// > Warning: With failsafe option (returns the original image in case of error)
    func resized(to size: CGSize) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        guard #available(iOS 10.0, *) else {
            UIGraphicsBeginImageContextWithOptions(size, false, .zero)
            defer { UIGraphicsEndImageContext() }
            draw(in: rect)
            
            if let resizedImage = UIGraphicsGetImageFromCurrentImageContext() {
                return resizedImage
            }
            
            return self
        }
        
        return UIGraphicsImageRenderer(size: size).image { _ in draw(in: rect) }
    }
}
