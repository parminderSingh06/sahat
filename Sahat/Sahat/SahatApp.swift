import SwiftUI

@main
struct SahatApp: App {
    @StateObject private var rootVM = RootViewModel()
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(rootVM)
        }
    }
}
