//
//  ProjectSwUIApp.swift
//  ProjectSwUI
//
//  Created by Apple Mac Air on 12.06.2024.
//

import SwiftUI

@main
struct ProjectSwUIApp: App {
    @AppStorage("isLinkOn") private var isLinkOn = false
    var body: some Scene {
        WindowGroup {
            ContentView()
            
                .preferredColorScheme(isLinkOn ? .dark : .light)
        }
    }
}
