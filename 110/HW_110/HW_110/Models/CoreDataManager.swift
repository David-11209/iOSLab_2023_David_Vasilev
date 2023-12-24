import UIKit
import CoreData
class CoreDataManager {
    static let shared = CoreDataManager()
    // MARK: - Core Data stack
    private init() {}
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "HW_110")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func obtainAllUsers() -> [User] {
            let userFetchRequest = User.fetchRequest()
            let sortDescriptor = NSSortDescriptor(key: "login", ascending: true)
            userFetchRequest.sortDescriptors = [sortDescriptor]

            let result = try? viewContext.fetch(userFetchRequest)
            return result ?? []
        }
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func createUser(login: String, password: String, fullName: String) {
        let user = User(context: viewContext)
        switch login {
        case "WorkCat":
            if let image = UIImage(named: "Avatar") {
                if let imageData = image.pngData() {
                    user.avatar = imageData
                }
            }
        case "WhiteCat":
            if let image = UIImage(named: "whitecat") {
                if let imageData = image.pngData() {
                    user.avatar = imageData
                }
            }
        case "CrazyCat":
            if let image = UIImage(named: "two cats") {
                if let imageData = image.pngData() {
                    user.avatar = imageData
                }
            }
        default:
            if let image = UIImage(named: "chinese_cat") {
                if let imageData = image.pngData() {
                    user.avatar = imageData
                }
            }
        }
        user.id = UUID()
        user.login = login
        user.password = password
        user.fullName = fullName
//        user.avatar = avatar.pngData()

        saveContext()
    }
    func obtainUsers() -> [User] {
        let userFetchRequest = User.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "login", ascending: true)
        userFetchRequest.sortDescriptors = [sortDescriptor]

        let result = try? viewContext.fetch(userFetchRequest)
        return result ?? []
    }
    func obtainUserPhotos(userId: UUID?) -> [Photo] {
        let user = obtainAllUsers().first(where: { $0.id == userId })
        let userPhotos = user?.photos?.allObjects as? [Photo]
//        let photoFetchRequest = Photo.fetchRequest()
//
//        let result = try? viewContext.fetch(photoFetchRequest)
        let result = userPhotos
        return result ?? []
    }
    func obtainSubsPhotos(userId: UUID?) -> [Photo]{
        let users = obtainAllUsers()
        print(users.count)
        var result: [Photo]? = []
        for user in obtainAllUsers() {
            if user.id != userId {
                let userPhotos = user.photos?.allObjects as? [Photo] ?? []
//                let photoFetchRequest = Photo.fetchRequest()
//
//                if let fetchedPhotos = try? viewContext.fetch(photoFetchRequest) {
//                    result?.append(contentsOf: fetchedPhotos)
//                }
                result?.append(contentsOf: userPhotos)
            }
        }
        return result ?? []
    }
    func deleteAllUsers() {
          let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
          let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
          do {
              try viewContext.execute(deleteRequest)
          } catch let error as NSError {
              print("Ошибка удаления объектов User: \(error), \(error.userInfo)")
          }
      }
    func createPhotoForUser(userId: UUID?) -> Photo {
        let user = obtainAllUsers().first(where: {$0.id == userId})
        let photo = Photo(context: viewContext)
        photo.id = UUID()
        photo.image = user?.avatar
        photo.comment = user?.login
        photo.date = Date()
        user?.addToPhotos(photo)
        saveContext()
        return photo
    }
}
