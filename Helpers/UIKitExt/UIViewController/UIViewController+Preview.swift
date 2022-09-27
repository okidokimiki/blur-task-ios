import SwiftUI

/**
 * ```
 * #if DEBUG
 * import SwiftUI
 *
 * struct ViewController_Preview: PreviewProvider {
 *     static var previews: some View {
 *         YourViewController()
 *             .showPreview()
 *             .ignoresSafeArea(.all)
 *     }
 * }
 * #endif
 * ```
 */

// cool-staff: https://useyourloaf.com/blog/xcode-previews-for-view-controllers/

#if DEBUG
extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        // This is to make your view controller representable
        func makeUIViewController(context: Context) -> UIViewController {
            viewController
        }
        
        // This method is called for any changes affecting the corresponding.
        // In our case, the view controller doesn’t depend on the state changes, so we leave it empty.
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    }
    
    func showPreview() -> some View {
        Preview(viewController: self)
    }
}
#endif
