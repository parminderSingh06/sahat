import Foundation
import SQLite3

class DatabaseManager{
    static let shared = DatabaseManager()
    private var db: OpaquePointer?
    
    private init(){
        
        createUserTable()
    }
    
    private func findDatabase() throws -> String{
        do {
            let fileUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Sahat.sqlite")
            return fileUrl.path()
        } catch{
            throw DatabaseError.failedToLocateDatabase(message: error.localizedDescription)
        }
        
    }
    
    private func openDatabase() throws{
        do{
            let databaseUrl = try findDatabase()
            sqlite3_open(databaseUrl, &db)
            print("Database is at: \(databaseUrl)")
        } catch {
            throw DatabaseError.failedToOpenDatabase(message: error.localizedDescription)
        }
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
