import SwiftUI

struct StepTwoOnboardView: View {
    @Binding var name: String
    @Binding var dob: Date
    
    var body: some View {
        VStack {
            Text("Lets Get Started. Enter Your Name and Age:")
            
            VStack{
                
                TextField("Enter Name", text: $name)
            }
        }
    }
}

