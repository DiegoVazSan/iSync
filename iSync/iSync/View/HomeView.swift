//
//  HomeView.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 28/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel : PostViewModel
    
    var body: some View {
        NavigationView {
            Text("Welcome !").font(.largeTitle).bold()
                .navigationTitle("iSync")
                .navigationBarItems(leading: Button {
                    viewModel.logout()
                } label: {
                    Text("logout")
                }, trailing: Button {
                    //
                } label: {
                    Text("Next")
                })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
