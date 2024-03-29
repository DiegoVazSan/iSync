//
//  UserDataViewModel.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 29/03/24.
//

import Foundation

class UserDataViewModel : ObservableObject {
    
    @Published var userProfielData = UserListModel(data: [])
    
    init() {
        fetch()
    }
    
    func fetch(){
        guard let secureURL = URL(string: "https://reqres.in/api/users?page=2") else { return }
        
        URLSession.shared.dataTask(with: secureURL) { data, response, error in
            guard let data = data else { return }
            do {
                    let decodedJson = try JSONDecoder().decode(UserListModel.self, from: data)
                DispatchQueue.main.async {
                    self.userProfielData = decodedJson
                }
                
            } catch let error as NSError{
                print("Error trying to fetch users data, ", error.localizedDescription)
            }
        }.resume()
    }
    
}
