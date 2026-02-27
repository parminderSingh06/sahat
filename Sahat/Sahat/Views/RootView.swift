import SwiftUI

struct RootView : View {
    @EnvironmentObject var viewModel : RootViewModel
    var body: some View {
        if viewModel.user == nil {
            OnboardingContainerView()
        }
        else {
            MainTabView()
        }
        
    }
    
}
