import Foundation

/* Super sweet syntactic sugar in Kotlin-style for Swift initializers */

protocol Appliable { }

extension Appliable where Self: AnyObject {
    
    /// Makes it available to set properties with closures just after initializing
    /// ```
    /// let label = UILabel().apply {
    ///     $0.textAlignment = .center
    ///     $0.textColor = .black
    ///     $0.text = "Hello, World!"
    /// }
    /// ```
    func apply(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}

extension NSObject: Appliable { }
