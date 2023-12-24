import UIKit

class ProfileViewController: UIViewController, UpdateProfileDataManagerDelegate {
    let profileView = ProfileView()
    let dataManager = ProfileDataManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProfileView()
        addTargetForButton()
        dataManager.getPosts()
        ProfileDataManager.shared.delegate = self
        ProfileDataManager.shared.navigationController = navigationController
        profileView.configUser(user: dataManager.user ?? User())
        setButtonAction()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        profileView.subscribersStackView.addGestureRecognizer(tapGesture)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        profileView.subscriptionsStackView.addGestureRecognizer(tapGesture2)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileView.collectionView.reloadData()
    }
    @objc func stackViewTapped() {
            let friendsViewController = FriendsViewController()
            navigationController?.pushViewController(friendsViewController, animated: true)
    }
    func setButtonAction() {
        profileView.setSettingsButtonActionClosure { [weak self] in
            let settingsViewController = SettingsViewController()
            settingsViewController.hidesBottomBarWhenPushed = true
            self?.navigationController?.pushViewController(settingsViewController, animated: true)
        }
    }
    func checkPhotos() {
        dataManager.checkPhotos()
    }
    private func setUpProfileView() {
        profileView.collectionView.delegate = dataManager
        profileView.collectionView.dataSource = dataManager
        profileView.collectionView.register(
            ProfileCollectionViewCell.self,
            forCellWithReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier)
        view = profileView
    }
    func dataDidChange() {
        DispatchQueue.main.async {
            self.profileView.collectionView.reloadData()
            self.profileView.countPublicationLabel.text = String(self.dataManager.photos.count)
        }
    }
    @objc func syncSaveButtonTapped() {
        print("сохранялка")

        dataManager.syncSave2()
    }
    @objc func asyncSaveButtonTapped() async {
        let photo = Photo()
        await dataManager.asyncSave(model: photo)
    }
    func addTargetForButton() {
        profileView.createContentButton.addTarget(self, action: #selector(syncSaveButtonTapped), for: .touchUpInside)
    }
}
