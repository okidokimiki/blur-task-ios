import Foundation

protocol FunctionalWrapper { }

extension FunctionalWrapper where Self: AnyObject {
    
    /// Makes it available to set properties with closures just after initializing
    /// ```
    /// let label = UILabel().do {
    ///     $0.textAlignment = .right
    ///     $0.textColor = .black
    ///     $0.text = "Hello, Ebiki!"
    /// }
    /// ```
    func `do`(_ mutator: (Self) -> Void) -> Self {
        mutator(self)
        return self
    }
}

extension NSObject: FunctionalWrapper { }
