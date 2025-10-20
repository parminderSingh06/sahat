import SwiftUI

struct StepTwoOnboardView: View {
    @Binding var name: String
    @Binding var age: Int
    
    var body: some View {
        VStack {
            Text("Lets Get Started. Enter Your Name and Age:")
            
            Spacer()
            
            VStack{
                
                VStack(alignment: .leading){
                    Text("Enter Name:")
                    TextField("", text: $name)
                }
                
                VStack(alignment: .leading){
                    Text("Enter Age:")
                    TextField("", value: $age, format: .number)
                        .keyboardType(.numberPad)
                }
                
            }
        }
    }
}

