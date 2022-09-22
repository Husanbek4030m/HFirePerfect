//
//  LoginView.swift
//  HFirePerfect
//
//  Created by Karavella on 22/09/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: SessionStore
    
    @State var email = "husanbek4030m@gmail.com"
    @State var psw = "112233"
    
    @State var showDetail = false
    @State var isLoading = false
    
    
    func doLogin() {
        self.isLoading = true
        SessionStore().signIn(email: email, password: psw) { (res, err) in
            self.isLoading = false
            if err != nil {
                print("Check email or psw")
                return
            }
            session.listen()
            print("----------------User signed in")
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                Spacer()
                Text("Welcome Back")
                    .font(.title)
                    .foregroundColor(.red)
                
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
                    doLogin()
                } label: {
                    HStack {
                        Spacer()
                        Text("Sign In")
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
                    Text("Don't have an account?")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16))
                    
                    Button {
                        self.showDetail = true
                        
                    } label: {
                        Text("SignUp")
                            .font(.system(size: 16))
                            .foregroundColor(.red)
                    }.sheet(isPresented: $showDetail) {
                        RegisterView()
                    }

                }
                
            }.padding(20)
            
            if self.isLoading {
                ProgressView()
            }
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
