import UIKit
protocol UpdatePublicationsDataManagerDelegate: AnyObject {
    func dataDidChange()
}
class PublicationsDataManager: NSObject, PublicationCollectionViewCellDelegate, UISearchBarDelegate {
    var funcButtonTapped: ((_ alertController: UIAlertController) -> Void)?
    var likeButtonTapped: ((_ alertController: UIAlertController) -> Void)?
    static var shared = PublicationsDataManager()
    let dataManager = ProfileDataManager.shared
    var sortedPublications: [Photo] = []
    weak var deleteDelegate: PublicationCollectionViewCellDelegate?
    weak var updateDelegate: UpdatePublicationsDataManagerDelegate?
    private let userDefaults = UserDefaults.standard
    private override init() {
        super.init()
    }
    func deleteItem(photo: Photo) async {
        Task {
            do {
                try await dataManager.asyncDelete(model: photo)
                updateUI()
            }
        }
    }
    func updateUI() {
        updateDelegate?.dataDidChange()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            sortedPublications = dataManager.photosProfile
            updateUI()
        } else {
            Task {
                let photos = await dataManager.asyncFind(model: searchText)
                self.sortedPublications = []
                for photo in photos {
                    self.sortedPublications.append(
                        Photo(
                        id: photo.id,
                        image: photo.image,
                        like: photo.like,
                        comment: photo.comment,
                        author: photo.author,
                        avatar: photo.avatar,
                        day: photo.day,
                        month: photo.month,
                        year: photo.year))
                }
                self.updateUI()
            }
        }
    }
    func setLikeInData(photo: Photo) {
        dataManager.likeCount[dataManager.user?.login ?? "", default: []].append(photo.id)
    }
    func removeLikeFromData(photo: Photo) {
        if var authorLikes = dataManager.likeCount[photo.author], let index = authorLikes.firstIndex(of: photo.id) {
            authorLikes.remove(at: index)
            dataManager.likeCount[photo.author] = authorLikes
        }
    }
}
