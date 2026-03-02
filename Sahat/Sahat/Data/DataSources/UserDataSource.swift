import Foundation
import SQLite3

protocol UserDAO {
    func insertUser(_ user: User)
    func getUser() -> User?
    func userExists() -> Bool
}

class SQLiteUserDataSource: UserDAO{
    private let db = DatabaseManager.shared.getDatabase()
    
    func insertUser(_ user: User) {
        let insertQuery = "INSERT INTO User (name, age, gender, weight, activityLevel, goal) VALUES (?, ?, ?, ?, ?, ?);"
        var stmt: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &stmt, nil) == SQLITE_OK {
            
            sqlite3_bind_text(stmt, 1, (user.name as NSString).utf8String, -1, nil)
            
            sqlite3_bind_int(stmt, 2, Int32(user.age))
            
            sqlite3_bind_text(stmt, 3, (user.gender.rawValue as NSString).utf8String, -1, nil)
            
            sqlite3_bind_double(stmt, 4, user.weight)
            
            sqlite3_bind_int(stmt, 5, Int32(user.activityLevel.rawValue))
            
            sqlite3_bind_text(stmt, 6, (user.goal.rawValue as NSString).utf8String, -1, nil)
            
            if sqlite3_step(stmt) == SQLITE_DONE {
                print("User saved successfully")
            } else{
                print("Failed to insert user: \(String(cString: sqlite3_errmsg(db)))")
            }
        }
        
        sqlite3_finalize(stmt)
    }
    
    func getUser() -> User? {
        let query = "SELECT * FROM User LIMIT 1"
        var stmt: OpaquePointer?
            
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK {
            let userRowData = sqlite3_step(stmt)
            if(userRowData == SQLITE_ROW){
                var user = User()

                user.name = String(cString:sqlite3_column_text(stmt, 1))

                user.age = Int(sqlite3_column_int(stmt, 2))

                if sqlite3_column_type(stmt, 3) != SQLITE_NULL {
                    user.gender = genderParser(String(cString:sqlite3_column_text(stmt, 3)))
                }
                else {
                    user.gender = Gender.unspecified
                }

                user.weight = sqlite3_column_double(stmt, 4)

                if sqlite3_column_type(stmt, 5) != SQLITE_NULL {
                    user.activityLevel = activityLevelParser(Int(sqlite3_column_int(stmt, 5)))
                }
                else {
                    user.activityLevel = ActivityLevel.unspecified
                }
                if sqlite3_column_type(stmt, 6) != SQLITE_NULL {
                    user.goal = goalParser(String(cString: sqlite3_column_text(stmt, 6)))
                }
                else{
                    user.goal = Goal.unspecified
                }
                sqlite3_finalize(stmt)
                print("User retrived succesfully.")
                return user;
            }
        }
        sqlite3_finalize(stmt)
        return nil
    }
    
    private func genderParser(_ genderString: String) -> Gender{
        if(genderString.prefix(1) == "m"){
            return Gender.male
        }else{
            return Gender.female
        }
    }
    
    private func activityLevelParser(_ level: Int) -> ActivityLevel{
        switch level {
        case 0:
            return ActivityLevel.sedentary
        case 1:
            return ActivityLevel.lightlyActive
        case 2:
            return ActivityLevel.moderatelyActive
        case 3:
            return ActivityLevel.veryActive
        case 4:
            return ActivityLevel.extraActive
        default:
            return ActivityLevel.unspecified
        }
        
    }
    
    private func goalParser(_ goal: String) -> Goal{
        switch goal{
        case "Lose Weight":
            return Goal.loseWeight
        case "Maintain Weight":
            return Goal.maintainWeight
        case "Gain Weight":
            return Goal.gainWeight
        case "Not Sure":
            return Goal.notSure
        default:
            return Goal.unspecified
        }
    }
    
    func userExists() -> Bool {
        let query = "SELECT 1 FROM User LIMIT 1"
        var stmt: OpaquePointer?
        
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK{
            
            if sqlite3_step(stmt) == SQLITE_ROW {
                sqlite3_finalize(stmt)
                return true;
            }
            
        }
        
        sqlite3_finalize(stmt)
        return false;
    }
}
