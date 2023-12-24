import Foundation
class SubscriptionPublicationsDataManager: NSObject, SubsPublicationsCellDelegate {
    static var shared = SubscriptionPublicationsDataManager()
    var coreDataManager = CoreDataManager.shared
    let dataManager = ProfileDataManager.shared
    var photos: [Photo] = []
    var photosModels: [Photo] = []
    var reloadData: (() -> Void)?
    private override init() {
        super.init()
    }
    func checkPhotos() {
        if photos.isEmpty {
            getPosts()
        }
    }
    private func getPosts() {
        photosModels = coreDataManager.obtainSubsPhotos(userId: dataManager.user?.id)
        photos = photosModels
      }
    func setLikeInData(photo: Photo) {

//        dataManager.likeCount[dataManager.user?.login ?? "", default: []].append(photo.id ?? "")
    }
    func removeLikeFromData(photo: Photo) {
//        if var authorLikes = dataManager.likeCount[dataManager.user?.login ?? ""]
//            , let index = authorLikes.firstIndex(of: photo.id ?? "") {
//            authorLikes.remove(at: index)
//            dataManager.likeCount[dataManager.user?.login ?? ""] = authorLikes
//        }
    }
}
