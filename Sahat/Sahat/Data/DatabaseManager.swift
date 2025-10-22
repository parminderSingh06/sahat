import Foundation
import SQLite3

class DatabaseManager{
    static let shared = DatabaseManager()
    private var db: OpaquePointer?
    
    private init(){
        openDatabase()
    }
    
    private func openDatabase(){
        let fileUrl = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Sahat.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            print("Error db cannot be opened")
        }
    }

}
