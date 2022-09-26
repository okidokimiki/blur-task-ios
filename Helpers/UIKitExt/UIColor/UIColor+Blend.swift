import UIKit

/** With this extension you can blend colors like this:
 * ```
 * // Make orange with 50% red and 50% yellow
 * let orange = .red * 0.5 + .yellow * 0.5
 *
 * // Make light gray with 25% black and 75% white
 * let lightGray = .black * 0.25 + .white * 0.75
 *
 * // Make sky blue by lightening a combination of 25% blue and 75% cyan
 * let skyBlue = (.blue * 0.25 + .cyan * 0.75) * 0.25 + .white * 0.75
 *
 * // Make dark red by combining 50% red and 50% black
 * let darkRed = .red * 0.50 + .black * 0.50
 *
 * // Make purple from 60% blue and 40% red
 * let purple = (.blue * 0.60 + .red * 0.40)
 *
 * // Then make lavender from 25% purple and 75% white
 * let lavender = purple * 0.25 + .white * 0.75
 */

extension UIColor {
    
    static func + (color1: UIColor, color2: UIColor) -> UIColor {
        var (r1, g1, b1, a1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        var (r2, g2, b2, a2) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))

        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        return UIColor(red: min(r1 + r2, 1), green: min(g1 + g2, 1), blue: min(b1 + b2, 1), alpha: (a1 + a2) / 2)
    }
    
    static func * (color: UIColor, multiplier: Double) -> UIColor {
        var (r, g, b, a) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: r * multiplier, green: g * multiplier, blue: b * multiplier, alpha: a)
    }
}
