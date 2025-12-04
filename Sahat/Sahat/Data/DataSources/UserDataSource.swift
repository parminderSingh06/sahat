import Foundation
import SQLite3

protocol UserDAO {
    func insertUser(_ user: User)
    func getUser() -> User?
}

class SQLiteUserDataSource: UserDAO{
    private let db = DatabaseManager.shared.getDatabase()
    
    func insertUser(_ user: User) {
        let insertQuery = "INSERT INTO User (name, age, gender, weight, activityLevel, goal) VALUES (?, ?, ?, ?, ?, ?);"
        var stmt: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &stmt, nil) == SQLITE_OK {
            
            sqlite3_bind_text(stmt, 1, (user.name as NSString).utf8String, -1, nil)
            
            sqlite3_bind_int(stmt, 2, Int32(user.age))
            
            if let gender = user.gender?.rawValue {
                sqlite3_bind_text(stmt, 3, (gender as NSString).utf8String, -1, nil)
            } else {
                sqlite3_bind_null(stmt, 3)
            }
            
            sqlite3_bind_double(stmt, 4, user.weight)
            
            if let activityLvl = user.activityLevel?.rawValue {
                sqlite3_bind_int(stmt, 5, Int32(activityLvl))
            } else {
                sqlite3_bind_null(stmt, 5)
            }
            
            if let goal2 = user.goal?.rawValue {
                sqlite3_bind_text(stmt, 6, (goal2 as NSString).utf8String, -1, nil)
            } else {
                sqlite3_bind_null(stmt, 6)
            }
            
            if sqlite3_step(stmt) == SQLITE_DONE {
                print("User saved successfully")
            } else{
                print("Failed to insert user: \(String(cString: sqlite3_errmsg(db)))")
            }
        }
        
        sqlite3_finalize(stmt)
    }
    
    func getUser() -> User? {
        //To Do
        return nil
    }
}
