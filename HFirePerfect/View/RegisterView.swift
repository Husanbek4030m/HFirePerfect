//
//  RegisterView.swift
//  HFirePerfect
//
//  Created by Karavella on 22/09/22.
//

import SwiftUI

struct RegisterView: View {
    @State var fullname = "Husanbek M"
    @State var email = "husanbek4030m@gmail.com"
    @State var psw = "112233"
    
    @Environment(\.presentationMode) var pr
    
    @State var isLoading = false
    
    
    func doRegister() {
        self.isLoading = true
        SessionStore().signUp(email: email, password: psw) { (res, err) in
            self.isLoading = false
            if err != nil {
                print("User not created \(String(describing: err))")
                return
            }
            print("User Created")
            self.pr.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                Spacer()
                Text("Create your account")
                    .font(.title)
                    .foregroundColor(.red)
                
                TextField("Fullname", text: $fullname)
                    .padding(10)
                    .padding(.horizontal, 15)
                    .foregroundColor(.black.opacity(0.4))
                    .background(.black.opacity(0.1))
                    .cornerRadius(50)
                
                TextField("Email", text: $email)
                    .padding(10)
                    .padding(.horizontal, 15)
                    .foregroundColor(.black.opacity(0.4))
                    .background(.black.opacity(0.1))
                    .cornerRadius(50)
                
                
                SecureField("Email", text: $psw)
                    .padding(10)
                    .padding(.horizontal, 15)
                    .foregroundColor(.black.opacity(0.4))
                    .background(.black.opacity(0.1))
                    .cornerRadius(50)
                
                Button {
                    doRegister()
                } label: {
                    HStack {
                        Spacer()
                        Text("Sign Up")
                            .foregroundColor(.white)
                        Spacer()
                    }
                        .padding(10)
                        .padding(.horizontal, 15)
                        .background(.red)
                        .cornerRadius(50)
                }

                
                Spacer()
                
                HStack(alignment: .center, spacing: 10) {
                    Text("Already have an account?")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16))
                    
                    Button {
                        self.pr.wrappedValue.dismiss()
                    } label: {
                        Text("SignIn")
                            .font(.system(size: 16))
                            .foregroundColor(.red)
                    }

                }
                
            }.padding(20)
            
            if isLoading {
                ProgressView()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
