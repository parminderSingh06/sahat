import Foundation
import Combine

final class OnboardingViewModel: ObservableObject {
    @Published private(set) var step: Int = 0
    @Published var user = User()
    @Published var userErrors = UserError()
    
    private let maxStep = 3
    
    func nextStep() {
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
            }
            
        case 2:
            
            break
            
        case 3:
            
            break
            
        default:
            break
        }
        
        return isValid
    }
    
}

