import UIKit
extension ProfileDataManager: DataChangeProtocol {
    func syncFind(model comment: String) throws -> [Photo] {
        return [Photo()]
    }
    func asyncFind(model comment: String) async -> [Photo] {
        return [Photo()]
    }
    func syncSave(model photo: Photo) {
//        photo.id = UUID()
//        photo.comment = user?.login
//        photo.image = user?.avatar
        photo.date = Date()
//        photo.user = user
////        user?.addToPhotos(photo)
//        photos.append(photo)
//        updateUI()
    }
    func asyncSave(model photo: Photo) async {
        return await withCheckedContinuation { continuation in
            saveQueue.async {
                self.photos.append(photo)
                self.updateUI()
                continuation.resume()
            }
        }
    }
    func syncGet() throws -> [Photo] {
        return photos
    }
    func asyncGet() async -> [Photo] {
        return await withCheckedContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now()) {
                continuation.resume(returning: self.photos)
            }
        }
    }
    func syncDelete(model photo: Photo) throws {
        if let index = photos.firstIndex(where: { $0.id == photo.id }) {
            photos.remove(at: index)
        }
        self.updateUI()
    }
    func asyncDelete(model photo: Photo) async {
        await withCheckedContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now()) {
                if let index = self.photos.firstIndex(where: { $0.id == photo.id }) {
                    self.photos.remove(at: index)
                    print(self.photos.count)
                }
                continuation.resume()
            }
        }
    }
//    func syncFind(model comment: String) throws -> [Photo] {
//        let findPublications = photosProfile.filter { $0.comment?.contains(comment)}
//        return findPublications
//    }
//    @Sendable func asyncFind(model comment: String) async -> [Photo] {
//        await withCheckedContinuation { continuation in
//            DispatchQueue.global().asyncAfter(deadline: .now()) {
//                continuation.resume(returning: self.photosProfile.filter { $0.comment?.contains(comment) })
//            }
//        }
//    }
}
