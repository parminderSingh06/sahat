import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack{
                Text("Welcome To Sahat.")
                    .font(Font.largeTitle)
                    .bold()
                
                Divider()
                
                Text("This app is meant to help you track your macros and workouts.")
                    .font(Font.title3)
            }
            
            
            Spacer()
            
            Button(action: {
                
            }){
                Text("Continue")
                    .font(Font.title2)
                    .bold()
                    .padding(10)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
            }
            .padding(.bottom, 40)
        }
        .frame(maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

#Preview {
    OnboardingIntroView()
}

