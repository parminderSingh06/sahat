import Foundation
import SQLite3

class DatabaseManager{
    static let shared = DatabaseManager()
    private var db: OpaquePointer?
    
    private init(){
        do{
            try openDatabase()
        } catch {
            print(error.localizedDescription)
        }
        
        do{
            try createUserTable()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func findDatabase() throws -> String{
        do {
            let fileUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Sahat.sqlite")
            print("Database is at: \(fileUrl.path())")
            return fileUrl.path()
        } catch{
            throw DatabaseError.failedToLocateDatabase(message: error.localizedDescription)
        }
        
    }
    
    private func openDatabase() throws{
        do{
            let databaseUrl = try findDatabase()
            if sqlite3_open(databaseUrl, &db) != SQLITE_OK {
                let errorMessage : String
                if let cString = sqlite3_errmsg(db){
                    errorMessage = String(cString: cString)
                } else {
                    errorMessage = "Unknown error occured when trying to open database."
                }
                throw DatabaseError.failedToOpenDatabase(message: errorMessage)
            }
        } catch {
            throw DatabaseError.failedToOpenDatabase(message: error.localizedDescription)
        }
    }
    
    private func createUserTable() throws{
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
            let errorMessage: String
            if let cString = sqlite3_errmsg(db) {
                errorMessage = String(cString: cString)
            } else {
                errorMessage = "Unknown error"
            }
            throw DatabaseError.failedToCreateTable(message: errorMessage)
        }
    }
    
    func getDatabase() -> OpaquePointer? {
        return db
    }
    
    private func closeDatabase() {
        if let db = db{
            sqlite3_close(db)
            self.db = nil
        }
        else{
            print("error no database to close.")
        }
    }
}

