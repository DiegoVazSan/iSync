//
//  DetailViewModel.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 29/03/24.
//

import Foundation

class DetailViewModel : ObservableObject {
    
    @Published var userDetailData: UserDetailModel?
    
    func fetch(id: Int){
        guard let secureURL = URL(string: "https://reqres.in/api/users/\(id)") else { return }
        
        URLSession.shared.dataTask(with: secureURL) { data, response, error in
            guard let data = data else { return }
            do {
                    let decodedJson = try JSONDecoder().decode(UserDetailModel.self, from: data)
                DispatchQueue.main.async {
                    self.userDetailData = decodedJson
                }
                
            } catch let error as NSError{
                print("Error trying to fetch users data, ", error.localizedDescription)
            }
        }.resume()
    }
}
