//
//  AddContactView.swift
//  HFirePerfect
//
//  Created by Karavella on 08/01/23.
//

import SwiftUI

struct AddContactView: View {
    @EnvironmentObject var session: SessionStore
    @Environment(\.presentationMode) var pr
    @ObservedObject var database = DatabaseStore()
    
    @State var isLoading = false
    @State var firstName = ""
    @State var lastName = ""
    @State var phone = ""
    
    func addContact() {
        isLoading = true
        let contact = Contacts(firstName: firstName, lastName: lastName, phone: phone)
        
        database.storeContact(contact: contact) { success in
            if success {
                print(success)
                self.pr.wrappedValue.dismiss()
            }
            isLoading = false
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                TextField("First Name", text: $firstName)
                    .frame(height: 50).padding(.leading, 10)
                    .background(Color.gray.opacity(0.2)).cornerRadius(8)
                TextField("Last Name", text: $lastName)
                    .frame(height: 50).padding(.leading, 10)
                    .background(Color.gray.opacity(0.2)).cornerRadius(8)
                TextField("Phone", text: $phone)
                    .frame(height: 50).padding(.leading, 10)
                    .background(Color.gray.opacity(0.2)).cornerRadius(8)
                
                Button {
                    addContact()
                } label: {
                    Spacer()
                    Text("Add").foregroundColor(.white)
                    Spacer()
                }.frame(height: 50).background(Color.red).cornerRadius(8)
                    .padding(.top, 20)
                
                
                Spacer()

            }
            if isLoading {
                ProgressView()
            }
            
        }.padding()
            .navigationTitle("Add Contact")
        
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
