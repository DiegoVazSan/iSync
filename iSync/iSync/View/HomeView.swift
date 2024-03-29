//
//  HomeView.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 28/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var postViewModel : PostViewModel
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            
            if homeViewModel.userData.isEmpty {
                ProgressView()
            } else {
                List(homeViewModel.userData, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.name).bold()
                        Text(item.email)
                    }
                }.navigationTitle("iSyncApp")
                    .navigationBarItems(leading: Button {
                        postViewModel.logout()
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
