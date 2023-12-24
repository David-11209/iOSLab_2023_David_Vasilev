import UIKit
class AuthorizationDataManager: NSObject {
    let userDefaults = UserDefaults.standard
    var coreDataManager = CoreDataManager.shared
    static let shared = AuthorizationDataManager()
    private override init() {}
    func checkUserRegistered(login: String, password: String, completion: @escaping (User?) -> Void) {
           Task {
               let user = await fetchUser(username: login, password: password)
               completion(user)
           }
       }

       private func fetchUser(username: String, password: String) async -> User? {
           let users = coreDataManager.obtainUsers()
           if let user = users.first(where: { $0.login == username && $0.password == password }) {
               saveAuthorizedUser(user: user)
               return user
           } else {
               return nil
           }
       }
    private func saveAuthorizedUser(user: User) {
        ///изменить ключи
         userDefaults.set(user.id?.uuidString, forKey: "loggedInUser")
         userDefaults.set(true, forKey: "isUserLogged")
     }
}
