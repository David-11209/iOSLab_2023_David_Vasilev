import UIKit
protocol UpdateProfileDataManagerDelegate: AnyObject {
    func dataDidChange()
}
class ProfileDataManager: NSObject {
    typealias Model = Photo
    private let dataSource = DataSource()
    var user: User?
    var photos: [Photo] = []
    var photosModels: [Photo] = []
    var photosSubscribers: [Photo] = []
    static let shared = ProfileDataManager()
    let coreDataManager = CoreDataManager.shared
    weak var delegate: UpdateProfileDataManagerDelegate?
    let saveQueue = DispatchQueue(label: "saveQueue")
    let getModelsQueue = DispatchQueue(label: "getModelsQueue")
    let deleteQueue = DispatchQueue(label: "deleteQueue")
    let findModelQueue = DispatchQueue(label: "findModelQueue")
    weak var navigationController: UINavigationController?
    let userDefaults = UserDefaults.standard
    var likeCount: [String: [String]] = [:]
    private override init() {
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUser(user: User) {
        self.user = user
    }
    func setPhotos(user: User) {
//        self.user = user
//        let key = user.login
//        if photosProfile.isEmpty && photosSubscribers.isEmpty {
//            for photos in DataSource.photosDictionary {
//                if photos.key == key {
//                    for index in 0..<photos.value.count {
//                        var photo = photos.value[index]
//                        if let likeIDs = likeCount[key ?? ""] {
//                            if likeIDs.contains(photo.id ?? "") {
//                                photo.like = true
//                            }
//                        }
//                        self.photosProfile.append(photo)
//                    }
//                } else {
//                    for index in 0..<photos.value.count {
//                        var photo = photos.value[index]
//                        if let likeIDs = likeCount[key ?? ""] {
//                            if likeIDs.contains(photo.id ?? "") {
//                                photo.like = true
//                            }
//                        }
//                        self.photosSubscribers.append(photo)
//                    }
//                }
//            }
//            photosProfile.sort { $0.year ?? "" > $1.year ?? "" }
//            photosSubscribers.sort { $0.year ?? "" > $1.year ?? "" }
//        }
    }
    func setUserInUserDefaults(user: User) {
//        do {
//            let encoder = JSONEncoder()
//            let userData = try encoder.encode(user)
//            userDefaults.set(userData, forKey: "userData")
//            userDefaults.set(true, forKey: "user")
//            self.user = user
//        } catch {
//            print("Error encoding user data: \(error.localizedDescription)")
//        }
    }
    func getUserFromUserDefaults() -> User? {
//        if let userData = userDefaults.data(forKey: "user") {
//            do {
//                let decoder = JSONDecoder()
//                let savedUser = try decoder.decode(User.self, from: userData)
//                print("Saved user: \(savedUser)")
//                return savedUser
//            } catch {
//                print("Error decoding user data: \(error.localizedDescription)")
//            }
//        }
        return nil
    }
//    func setLikedPhotosInUserDefaults() {
//        do {
//            let encoder = JSONEncoder()
//            let likesCountData = try encoder.encode(likeCount)
//            userDefaults.setValue(likesCountData, forKey: "likesCountData")
//            userDefaults.set(true, forKey: "likes")
//        } catch {
//            print("Error encoding user data: \(error.localizedDescription)")
//        }
//    }
//    func updateLikesFromUserDefaults() {
//        if let likesCountData = userDefaults.data(forKey: "likesCountData") {
//            do {
//                let decoder = JSONDecoder()
//                let likesCountDict = try decoder.decode([String: [String]].self, from: likesCountData)
//                likeCount = likesCountDict
//            } catch {
//                print("Error decoding user data: \(error.localizedDescription)")
//            }
//        }
//    }
    func checkPhotos() {
        if photos.isEmpty {
            getPosts()
        }
    }
    func getPosts() {
        photosModels = coreDataManager.obtainUserPhotos(userId: user?.id)
        var wqwer = coreDataManager.obtainSubsPhotos(userId: user?.id)
        photos = photosModels
    }
    func getCountLike(photoId: String) -> Int {
        var count = 0
        for (_, idArray) in likeCount where idArray.contains(photoId) {
            count += 1
        }
        return count
    }
    func syncSave2() {
//        var photo = Photo()
//        photo.id = UUID()
//        photo.comment = user?.login
//        photo.image = user?.avatar
//        photo.date = Date()
//        photo.user = user
         var photo = coreDataManager.createPhotoForUser(userId: user?.id)
//        user?.addToPhotos(photo)
        photos.append(photo)
        updateUI()
    }
    func removeUserFromUserDefaults() {
        userDefaults.removeObject(forKey: "user")
    }
    func updateUI() {
        delegate?.dataDidChange()
    }
}
