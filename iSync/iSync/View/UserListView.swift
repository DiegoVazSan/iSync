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
                    //AsyncImage(url: URL(string: item.avatar)).clipShape(Circle())
                    Image(systemName: "persona.fill").data(strURL: item.avatar)
                        .frame(width:80, height: 80)
                        .clipped()
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(item.first_name).font(.title)
                        Text(item.email).font(.subheadline)
                    }.padding()
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

extension Image {
    func data(strURL: String) -> Self {
        let url = URL(string: strURL)
        if let data = try? Data(contentsOf: url!) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
