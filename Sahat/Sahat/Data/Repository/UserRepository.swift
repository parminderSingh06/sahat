import Foundation
import SQLite3

class UserRepository{
    private let dataSource: UserDAO
    
    init(dataSource: UserDAO = SQLiteUserDataSource()) {
        self.dataSource = dataSource
    }
    
    func insert(user: User){
        dataSource.insertUser(user)
    }
    
    func getUser() -> User? {
        return dataSource.getUser()
    }
    
    func userExists() -> Bool {
        return dataSource.userExists();
    }
}
