import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    // These names MUST match the names of the images in your Assets folder exactly
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    
    // @State variables tell SwiftUI to re-draw the screen whenever these values change
    @State private var currentElementIndex = 0
    @State private var answerText = "?"
    
    var body: some View {
        VStack {
            Spacer()
            
            // 1. The Element Image
            // It looks into Assets.xcassets for a name matching the string in elementList
            Image(elementList[currentElementIndex])
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Spacer()
                .frame(height: 40)
            
            // 2. The Answer Label
            Text(answerText)
                .font(.body)
                .foregroundColor(.gray)
            
            Spacer()
            
            // 3. Buttons Row
            HStack {
                // Show Answer Button
                Button(action: {
                    showAnswer()
                }) {
                    Text("Show Answer")
                }
                
                Spacer()
                
                // Next Button
                Button(action: {
                    nextElement()
                }) {
                    Text("Next")
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 80)
        }
    }
    
    // MARK: - Logic Functions
    
    func showAnswer() {
        // Set the answer label to the name of the current element
        answerText = elementList[currentElementIndex]
    }
    
    func nextElement() {
        // Increment the index
        currentElementIndex += 1
        
        // Loop back to the start if we reach the end of the list
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
        }
        
        // Reset the answer text for the new element
        answerText = "?"
    }
}

#Preview {
    ContentView()
}
