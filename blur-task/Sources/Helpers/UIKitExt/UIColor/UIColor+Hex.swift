import UIKit

extension UIColor {
    
    /// Get the color from a hexadecimal color code using `Int`
    ///
    /// Supported formats:
    /// - hex: `0xFFFFFF`
    ///
    /// > Warning: There is no handling of the case of incorrect input
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    /// Get the color from a hexadecimal color code using `String`
    ///
    /// Supported formats
    /// - hex: `"FFF"`, `"#FFF"`, `"0xFFFFFF"`
    /// - hex with alpha: `"FFFFFF11"`, `"0xFFFFFFFF11"`, `"#FFFFFF11"`
    convenience init?(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
            .replacingOccurrences(of: "0x", with: "")
        
        var rgb: UInt64 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        switch hexSanitized.count {
        case 6: // default hex: "#ffffff"
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        case 8: // hex with alpha: "#ffffffff"
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        default:
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
