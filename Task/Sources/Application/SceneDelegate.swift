import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        navigationController = .translucentNavigationController()
        navigationController?.pushViewController(PhotoStreamViewController(), animated: false)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.backgroundColor = .background
        window?.makeKeyAndVisible()
    }
}
