import SwiftUI

struct StepTwoOnboardView: View {
    @Binding var name: String
    @Binding var age: Int
    
    var body: some View {
        VStack {
            Text("Lets Get Started. Enter Your Name and Age:")
            
            Spacer()
            
            VStack{
                
                VStack{
                    Text("Enter Name:")
                    TextField("", text: $name)
                        .multilineTextAlignment(.center)
                }
                
                VStack(){
                    Text("Enter Age:")
                    Text("\(age)")
                    Stepper("", value: $age, in: 13...100)
                        .labelsHidden()
                }
                
            }
        }
    }
}

