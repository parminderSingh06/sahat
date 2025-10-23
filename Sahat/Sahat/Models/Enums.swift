enum Gender: String{
    case male
    case female
}

enum ActivityLevel: Int, CaseIterable, Identifiable{
    case sedentary = 0
    case lightlyActive = 1
    case moderatelyActive = 2
    case veryActive = 3
    case extraActive = 4
    
    var id: Int { self.rawValue }
    var description: String {
        switch self {
        case .sedentary: return "Sedentary (little or no exercise)"
        case .lightlyActive: return "Lightly Active (1–3 days/week)"
        case .moderatelyActive: return "Moderately Active (3–5 days/week)"
        case .veryActive: return "Very Active (6–7 days/week)"
        case .extraActive: return "Super Active (intense exercise daily)"
        }
    }

}

enum Goal: String, CaseIterable, Identifiable {
    var id: String {rawValue}
    case loseWeight = "Lose Weight"
    case maintainWeight = "Maintain Weight"
    case gainWeight = "Gain Weight"
    case notSure = "Not Sure"
}

enum DatabaseError: Error {
    case failedToLocateDatabase(message: String)
    case failedToCreateTable(message: String)
}
