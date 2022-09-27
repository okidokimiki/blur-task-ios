import UIKit

extension UIColor {
    
    /// With this method, now every time user switches between `.dark` and `.light` modes, the specified colors will change dynamically through the Application.
    /// - Parameters:
    ///   - light: The color to use in light mode.
    ///   - dark: The color to use in dark mode.
    /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
    static func dynamic(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return light }
        
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
    
    /// Easily define two colors for both light and dark mode.
    /// - Parameters:
    ///   - light: The color to use in light mode.
    ///   - dark: The color to use in dark mode.
    /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
    static func | (light: UIColor, dark: UIColor) -> UIColor {
        self.dynamic(light: light, dark: dark)
    }
}
