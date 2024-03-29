//
//  PostViewModel.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 28/03/24.
//

import Foundation

class PostViewModel : ObservableObject {
    
    @Published var authenticated = 0
    
    /*init() {
     //TEST
        login(email: "eve.holt@reqres.in", password: "cityslicka")
    }*/
    
    func login(email: String, password: String){
        guard let secureURL = URL(string: "https://reqres.in/api/login") else { return }
        let parameters = ["email":email, "password":password]
        let body = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: secureURL)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(PostModel.self, from: data)
                if !decodedData.token.isEmpty {
                    DispatchQueue.main.async {
                        self.authenticated = 1
                    }
                }
            } catch let error as NSError {
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
                print("Error tryng to post, ", error.localizedDescription)
            }
            
        }.resume()
        
    }
}
