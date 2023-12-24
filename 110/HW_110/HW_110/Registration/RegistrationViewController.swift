import UIKit

class RegistrationViewController: UIViewController {
    let registrationView = RegistrationView()
    private var coreDataManager = CoreDataManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registrationView
        addTargetForButton()
    }
    func addTargetForButton() {
        registrationView.enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    }
    @objc func enterButtonTapped() {
        print("нажал")
        registrationView.enterButtonTapped = { [weak self] login, password, fullName in
            self?.coreDataManager.createUser(login: login, password: password, fullName: fullName)
            self?.navigationController?.popViewController(animated: true)
        }
    }
    func setUpTabBar(user: User) {
        FriendsDataManager.shared.setData(currentUser: user)
        let profileViewController = ProfileViewController()
//        profileViewController.dataManager.updateLikesFromUserDefaults()
        profileViewController.dataManager.setPhotos(user: user)
        let subPublicationsViewController = SubscriptionPublicationsViewController()
        let originalImage = UIImage(resource: .home2)
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 25, height: 20))
        let resizedImage = renderer.image { (_) in
            originalImage.draw(in: CGRect(x: 0, y: 0, width: 25, height: 20))
        }
        let originalImage2 =  UIImage(resource: .profile)
        let renderer2 = UIGraphicsImageRenderer(size: CGSize(width: 25, height: 25))
        let resizedImage2 = renderer2.image { (_) in
            originalImage2.draw(in: CGRect(x: 0, y: 0, width: 25, height: 25))
        }
        subPublicationsViewController.tabBarItem = UITabBarItem(
            title: "Главная", image: resizedImage, selectedImage: nil)
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: resizedImage2, selectedImage: nil)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [UINavigationController(
            rootViewController: subPublicationsViewController),
            UINavigationController(rootViewController: profileViewController)]
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = tabBarController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}
