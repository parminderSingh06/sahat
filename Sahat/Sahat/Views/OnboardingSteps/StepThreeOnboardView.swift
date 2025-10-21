import SwiftUI

struct StepThreeOnboardView: View {
    @Binding var gender: Gender?
    @Binding var weight: Double
    
    var body: some View {
        VStack {
            Text("Enter Your Gender and Weight:")
            
            Spacer()
            
            VStack{
                
                VStack{
                    Text("Select Gender")
                    Picker("Gender", selection: $gender){
                        Text("Male").tag(Gender.male)
                        Text("Female").tag(Gender.female)
                    }
                    .pickerStyle(.segmented)
                    .padding(10)
                }
                
                VStack{
                    Text("Enter Weight")
                    TextField("",value: $weight, format: .number)
                        .keyboardType(.numberPad)
                        .padding(10)
                        .multilineTextAlignment(.center)
                }
                
            }
        }
    }
}
