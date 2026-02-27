import Foundation
import Combine

final class RootViewModel : ObservableObject {
    @Published var user: User?
    
    private let userRepository = UserRepository()
    
    init() {
        self.user = userRepository.getUser()
    }
    
    func reloadUser(){
        user = userRepository.getUser()
    }
    
}
