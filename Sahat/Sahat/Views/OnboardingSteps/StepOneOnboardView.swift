import SwiftUI

struct StepOneOnboardView: View {
    @Binding var name: String
    @Binding var age: Int
    @Binding var nameError: String?
    @Binding var ageError: String?
    
    var body: some View {
        VStack {
            Text("Lets Get Started. Enter Your Name and Age:")
            
            Spacer()
            
            VStack{
                
                VStack{
                    Text("Enter Name:")
                    TextField("", text: $name)
                        .multilineTextAlignment(.center)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(10)
                    
                    if let error = nameError{
                        Text("\(error)")
                            .foregroundStyle(.red)
                    }
                }
                
                VStack(){
                    Text("Enter Age:")
                    Text("\(age)")
                    Stepper("", value: $age, in: 13...100)
                        .labelsHidden()
                    
                    if let error = ageError{
                        Text("\(error)")
                            .foregroundStyle(.red)
                    }
                }
                
            }
        }
    }
}

