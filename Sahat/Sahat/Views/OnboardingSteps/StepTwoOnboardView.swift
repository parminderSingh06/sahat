import SwiftUI

struct StepTwoOnboardView: View {
    @Binding var gender: Gender?
    @Binding var weight: Double
    @Binding var genderError: String?
    @Binding var weightError: String?
    
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
                    
                    if let error = genderError{
                        Text("\(error)")
                            .foregroundStyle(.red)
                    }
                }
                
                VStack{
                    Text("Enter Weight(lbs)")
                    HStack(spacing: 0){
                        TextField("",value: $weight, format: .number)
                            .keyboardType(.numberPad)
                            .padding(10)
                            .multilineTextAlignment(.center)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    
                    if let error = weightError{
                        Text("\(error)")
                            .foregroundStyle(.red)
                    }
                }
                
            }
        }
    }
}
