import Foundation

struct User: Identifiable {
    var id: Int = 1
    var name: String = ""
    var age: Int = 18
    var weight: Double = 0.0
    var gender: Gender?
    var activityLevel: ActivityLevel?
    var goal: Goal?
    var accountCompleted: Bool = false
}
