
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView() {
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "book")
                }
            
            HelloView()
                .tabItem {
                    Label("World", systemImage: "globe.europe.africa")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
        ContentView()
}
