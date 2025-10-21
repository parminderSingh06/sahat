import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String = ""
    var age: Int = 18
    var weight: Double = 0.0
    var gender: Gender?
    var activityLevel: ActivityLevel?
    var goal: Goal?
    var accountCompleted: Bool = false
}
