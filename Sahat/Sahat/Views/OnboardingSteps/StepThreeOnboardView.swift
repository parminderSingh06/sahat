import SwiftUI

struct StepThreeOnboardView: View {
    @Binding var activityLevel: ActivityLevel?
    @Binding var goal: Goal?
    @Binding var activityLevelError: String?
    @Binding var goalError: String?
    
    var body: some View {
        VStack {
            Text("Enter Your Activity Level, and your goal:")
            
            Spacer()
            
            VStack{
                
                VStack{
                    Text("What is your activity level?")
                    Picker("Activity Level", selection:$activityLevel){
                        ForEach(ActivityLevel.allCases){ level in
                            Text(level.description).tag(level)
                        }
                    }
                    
                    if let error = activityLevelError{
                        Text("\(error)")
                            .foregroundStyle(.red)
                    }
                }
                
                VStack{
                    Text("What is your goal?")
                    Picker("Goal", selection:$goal){
                        ForEach(Goal.allCases){ goal in
                            Text(goal.rawValue).tag(goal)
                        }
                    }
                    
                    if let error = goalError{
                        Text("\(error)")
                            .foregroundStyle(.red)
                    }
                }
                
            }
        }
    }
}
