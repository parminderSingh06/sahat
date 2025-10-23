import Foundation

struct UserError{
    
    var nameError: String?
    var ageError: String?
    var genderError: String?
    var weightError: String?
    var goalError: String?
    var activityLevelError: String?
}

enum DatabaseError: Error {
    case failedToLocateDatabase(message: String)
    case failedToOpenDatabase(message: String)
    case failedToCreateTable(message: String)
}

