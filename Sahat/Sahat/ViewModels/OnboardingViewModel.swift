import Foundation
import Combine

final class OnboardingViewModel: ObservableObject {
    @Published private(set) var step: Int = 0
    @Published var user = User()
    @Published var userErrors = UserError()
    
    private let userRepository = UserRepository()
    
    private let maxStep = 3
    
    func nextStep() {
        if(step == 3){
            userRepository.insert(user: user)
        }
        
        guard validateCurrentStep() else { return }
        step = min(step + 1, maxStep)
        
        
    }
    
    func previousStep() {
        step = max(step - 1, 0)
    }
    
    private func validateCurrentStep() -> Bool {
        userErrors = UserError()
        var isValid = true
        
        switch step {
        case 1:
            if user.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                userErrors.nameError = "Please enter a name"
                isValid = false
            } else if user.name.count > 50 {
                userErrors.nameError = "Name is too long"
                isValid = false
            } else if user.name.count < 3 {
                userErrors.nameError = "Name is too short"
                isValid = false
            }
            
        case 2:
            if user.gender == nil {
                userErrors.genderError = "Please select a gender"
                isValid = false
            } else if user.weight < 70 || user.weight > 400 {
                userErrors.weightError = "Please enter a valid weight"
                isValid = false
            }
            
        case 3:
            if user.activityLevel == nil {
                userErrors.activityLevelError = "Please select an activity level"
                isValid = false
            } else if user.goal == nil {
                userErrors.goalError = "Please select a goal"
                isValid = false
            }
            
        default:
            break
        }
        
        return isValid
    }
    
}

