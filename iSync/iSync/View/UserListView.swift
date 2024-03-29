//
//  UserListView.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 29/03/24.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var viewModel = UserDataViewModel()
    
    var body: some View {
        if viewModel.userProfielData.data.isEmpty {
            ProgressView()
        } else {
            List(viewModel.userProfielData.data, id: \.id) { item in
                HStack {
                    
                    AsyncImage(url: URL(string: item.avatar)).cornerRadius(70)
                    VStack(alignment: .leading) {
                        Text(item.first_name).font(.title)
                        Text(item.email).font(.subheadline)
                    }
                }.navigationBarTitle("MyFriends")
            }
        }
    }

    
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
