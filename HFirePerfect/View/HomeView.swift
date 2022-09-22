//
//  HomeView.swift
//  HFirePerfect
//
//  Created by Karavella on 22/09/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session:SessionStore
    
    func didQuit() {
        if SessionStore().signOut() {
            session.listen()
        }
    }
    var body: some View {
        NavigationView {
            VStack {
                if let email = session.session?.email {
                    Text("Welcome " + email)
                }
            }
            .navigationBarTitle("Home Page", displayMode: .inline)
            .navigationBarItems(trailing:
                HStack {
                Button {
                    didQuit()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right").foregroundColor(.red)
                }
                }
            )
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
