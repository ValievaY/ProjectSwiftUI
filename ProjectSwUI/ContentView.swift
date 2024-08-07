
import SwiftUI

struct ContentView: View {
    
    @AppStorage("titleOn") var titleOn = false
    
    var body: some View {
        TabView() {
            InfoView(titleOn: titleOn)
                .tabItem {
                    Label("Info", systemImage: "book")
                }
            
            HelloView()
                .tabItem {
                    Label("World", systemImage: "globe.europe.africa")
                }
            
            SettingsView(titleOn: $titleOn)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
        ContentView()
}
