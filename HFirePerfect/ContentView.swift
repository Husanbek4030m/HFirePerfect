//
//  ContentView.swift
//  HFirePerfect
//
//  Created by Karavella on 16/09/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    
    var body: some View {
        VStack {
            if session.session != nil {
                HomeView()
            } else {
                LoginView()
            }
        }.onAppear {
            session.listen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
