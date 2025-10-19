import SwiftUI

struct StepTwoOnboardView: View {
    @State private var name: String = ""
    var body: some View {
        VStack {
            Text("Lets Get Started. Enter Your Name and Date of Birth:")
            
            VStack{
                
                TextField("Enter Name", text: $name)
            }
        }
    }
}

