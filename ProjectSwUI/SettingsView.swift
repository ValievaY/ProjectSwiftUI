
import SwiftUI

struct SettingsView: View {
    
    var colors = ["Red", "Green", "Blue", "Yellow"]
    
    @State private var isNotificationEnabled = false
    @State private var selectedColor = "Red"
    @State private var value: Double = 0
    
    var body: some View {
        Form {
            Section {
                Toggle("Notification enabled", isOn: $isNotificationEnabled.animation())
                
            }
            
            Section {
                VStack {
                    Picker("Please choose a color", selection: $selectedColor) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            
            Section {
                VStack {
                    Slider(value: $value, in: 0...100)
                    Text("\(value, specifier: "%.1f")")
                }
            }
        }
    }
}

#Preview {
        SettingsView()
}
