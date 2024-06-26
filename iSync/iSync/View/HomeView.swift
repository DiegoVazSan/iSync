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
                        Text(item.name).bold().font(.title3)
                        Text("Lat \(item.address.geo.lat), Lng \(item.address.geo.lng)")
                    }
                }.navigationTitle("iSyncApp")
                    .navigationBarItems(leading: Button {
                        postViewModel.logout()
                    } label: {
                        Image(systemName: "door.left.hand.open").foregroundColor(.red)
                    }, trailing: NavigationLink(destination: UserListView()){
                        Image(systemName: "person.2.fill").foregroundColor(.indigo)
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
