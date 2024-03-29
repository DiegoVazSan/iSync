//
//  LoginView.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 28/03/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var login : PostViewModel
    
    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Email")
                    .foregroundColor(.white)
                    .bold()
                TextField("Email", text: $email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                
                
                Text("Password")
                    .foregroundColor(.white)
                    .bold()
                SecureField("Password", text: $password)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    login.login(email: email, password: password)
                } label: {
                    Text("Login").foregroundColor(.white).bold()
                }
                
            }
            .padding()

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
