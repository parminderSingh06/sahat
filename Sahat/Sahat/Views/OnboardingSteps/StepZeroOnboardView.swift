import SwiftUI

struct StepZeroOnboardView: View {
    var body: some View {
        VStack{
            Text("Welcome To Sahat.")
                .font(Font.largeTitle)
                .bold()
            
            Divider()
            
            Text("This app is meant to help you track your macros and workouts.")
                .font(Font.title3)
        }
            
    }
}
