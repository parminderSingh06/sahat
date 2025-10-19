import Foundation
import Combine

final class OnboardingViewModel: ObservableObject {
    @Published private(set) var step: Int = 0
    
    func nextStep() {
        step += 1
    }
    
    func previousStep() {
        step = max(step - 1, 0)
    }
}

