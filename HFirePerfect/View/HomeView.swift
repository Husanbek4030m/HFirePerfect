//
//  HomeView.swift
//  HFirePerfect
//
//  Created by Karavella on 22/09/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session:SessionStore
    @ObservedObject var database = DatabaseStore()
    @State var isLoading = false
    
    func didQuit() {
        if SessionStore().signOut() {
            session.listen()
        }
    }
    
    func apiContacts() {
        isLoading = true
        database.loadContacts {
            print(database.items.count)
            isLoading = false
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List{
                    ForEach(database.items, id: \.self) { item in
                        ContactCell(contact: item)
                    }
                }.listStyle(.plain)
                if isLoading {
                    ProgressView()
                }
            }
            .navigationBarTitle("Home Page", displayMode: .inline)
            .navigationBarItems(trailing:
                HStack {
                NavigationLink(destination: {
                    AddContactView()
                }, label: {
                    Image(systemName: "phone.badge.plus").foregroundColor(.red)
                })
                
                Button {
                    didQuit()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right").foregroundColor(.red)
                }
                }
            )
        }.onAppear{
            apiContacts()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
