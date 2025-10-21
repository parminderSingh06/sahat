import SwiftUI

struct OnboardingContainerView: View {
    @StateObject var viewModel = OnboardingViewModel()
    var body: some View {
        VStack {
            if viewModel.step != 0{
                Button(action: {viewModel.previousStep()}){
                    Image("back-arrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 20)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            
            Spacer()
            
            if viewModel.step == 0{
                StepZeroOnboardView()
            }else if viewModel.step == 1{
                StepOneOnboardView(name: $viewModel.user.name, age: $viewModel.user.age)
            }else if viewModel.step == 2{
                StepTwoOnboardView(gender: $viewModel.user.gender, weight: $viewModel.user.weight)
            }else if viewModel.step == 3{
                StepThreeOnboardView(activityLevel: $viewModel.user.activityLevel, goal: $viewModel.user.goal)
            }
            
            Spacer(minLength: 400)
            
            Button(action: {
                viewModel.nextStep()
            }){
                Text("Continue")
                    .font(Font.title2)
                    .bold()
                    .padding(10)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(0)
                
            }
            .padding(.bottom, 40)
            
        }
        
    }
}

#Preview {
    OnboardingContainerView()
}
