//
//  HomeViewModel.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 28/03/24.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var userData : [UserModel] = []
    
    init() {
        fetch()
    }
    
    func fetch(){
        guard let secureURL = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: secureURL) { data, response, error in
            guard let data = data else { return }
            do {
                    let decodedJson = try JSONDecoder().decode([UserModel].self, from: data)
                DispatchQueue.main.async {
                    self.userData = decodedJson
                }
                
            } catch let error as NSError{
                print("Error trying to fetch users data, ", error.localizedDescription)
            }
        }.resume()
    }
    
}
