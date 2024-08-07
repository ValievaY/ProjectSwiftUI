
import SwiftUI

struct SettingsView: View {
    
    @State private var selectedColor = "Red"
    @AppStorage("rowSize") private var value: Double = 100
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isLinkOn") private var isLinkOn = false
    @Binding var titleOn: Bool
    @State private var isEditing = false
    
    var body: some View {
        Form {
            Section {
                Toggle("\(colorScheme == .light ? "Light Theme enabled" : "Dark Theme enabled")", isOn: $isLinkOn.animation())
                
            }
            
            Section {
                Toggle("\(titleOn ? "Navigation title enabled" : "Navigation title not enabled")", isOn: $titleOn.animation())
            }
            
            Section {
                VStack {
                    Slider(value: $value, in: 50...150, step: 5, onEditingChanged: { editing in
                        isEditing = editing
                     })
                    Text("Row size \(value, specifier: "%.1f")")
                    Spacer()
                    if isEditing {
                        HStack {
                            Image(.spiderMan)
                                .resizable()
                                .frame(width: value)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            Text("Spider-Man").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                        .frame(height: value)
                    }
                }
            }
        }
    }
}

#Preview {
    let title = ContentView().titleOn
    return SettingsView(titleOn: .constant(title))
}
