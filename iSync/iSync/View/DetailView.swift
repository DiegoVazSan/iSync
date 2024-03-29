//
//  DetailView.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 29/03/24.
//

import SwiftUI

struct DetailView: View {
    
    var id : Int
    @StateObject var viewModel = DetailViewModel()
    
    var body: some View {
        let userData = viewModel.userDetailData?.data
        VStack {
            
            if ((userData?.avatar.isEmpty) != nil) {
                Image(systemName: "persona.fill").data(strURL: userData?.avatar ?? "")
                    .frame(width:150, height: 150)
                    .clipped()
                    .clipShape(Circle())
                VStack(alignment: .center) {
                    Text(userData?.first_name ?? "").font(.largeTitle).bold()
                    Text(userData?.email ?? "").font(.title)
                }.padding()
                
            } else {
                ProgressView()
            }
            
        }.onAppear{
            viewModel.fetch(id: id)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: Int())
    }
}
