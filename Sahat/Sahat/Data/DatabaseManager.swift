import Foundation
import SQLite3

class DatabaseManager{
    static let shared = DatabaseManager()
    private var db: OpaquePointer?
    
    private init(){
        openDatabase()
        createUserTable()
    }
    
    private func openDatabase(){
        let fileUrl = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Sahat.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            print("Error db cannot be opened")
        }
        
        print("Database is at: \(fileUrl.path())")
    }
    
    private func createUserTable(){
        let query = """
            CREATE TABLE IF NOT EXISTS User (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                age INTEGER,
                gender TEXT,
                weight REAL,
                activityLevel INT,
                goal TEXT
            );
            """
        if sqlite3_exec(db, query, nil, nil, nil) != SQLITE_OK {
            print("Failed to create table: \(String(cString: sqlite3_errmsg(db)))")
        }
    }
    
    func getDatabase() -> OpaquePointer? {
        return db
    }
}
