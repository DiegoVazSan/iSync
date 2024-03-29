//
//  ContentView.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 28/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var login : PostViewModel
    
    var body: some View {
        Group {
            if login.authenticated == 0 {
                LoginView()
            } else if login.authenticated == 1 {
                HomeView()
            } else if login.authenticated == 2 {
                VStack {
                    Text("User and password incorrect")
                    Button {
                        login.authenticated = 0
                    } label: {
                        Text("Return")
                    }

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
