import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private(set) var navigationController: UINavigationController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        
        navigationController = .translucentNavigationController()
        navigationController?.pushViewController(PhotoStreamViewController(), animated: false)
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.backgroundColor = .background // is it goot idea?
        window?.makeKeyAndVisible()
    }
}
