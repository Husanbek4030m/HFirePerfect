//
//  HFirePerfectApp.swift
//  HFirePerfect
//
//  Created by Karavella on 16/09/22.
//

import SwiftUI
import Firebase

@main
struct HFirePerfectApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SessionStore())
        }
    }
}
