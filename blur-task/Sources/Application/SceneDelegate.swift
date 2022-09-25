import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        #warning("Не нравится кол-во скобок. Мб можно как-то вынести UINavigationController в проперти?")
        window?.rootViewController = UINavigationController(rootViewController: PhotoStreamViewController())
        window?.makeKeyAndVisible()
    }
}
