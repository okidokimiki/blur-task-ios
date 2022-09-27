import SwiftUI

/**
 * ```
 * #if DEBUG
 * import SwiftUI
 *
 * struct View_Preview: PreviewProvider {
 *     static var previews: some View {
 *         YourView()
 *             .showPreview()
 *             .ignoresSafeArea(.all)
 *     }
 * }
 * #endif
 * ```
 */

#if DEBUG
extension UIView {
    
    private struct Preview: UIViewRepresentable {
        let view: UIView
        
        func makeUIView(context: Context) -> UIView { view }
        func updateUIView(_ uiView: UIView, context: Context) { }
    }
    
    func showPreview() -> some View {
        Preview(view: self)
    }
}
#endif
