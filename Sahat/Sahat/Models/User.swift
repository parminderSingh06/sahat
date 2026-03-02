import Foundation

struct User {
    var name: String = ""
    var age: Int = 18
    var weight: Double = 0.0
    var gender: Gender = Gender.unspecified
    var activityLevel: ActivityLevel = ActivityLevel.unspecified
    var goal: Goal = Goal.unspecified
}
