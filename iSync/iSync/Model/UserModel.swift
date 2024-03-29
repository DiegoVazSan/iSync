//
//  UserModel.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 28/03/24.
//

import Foundation

struct UserModel : Decodable {
    var id : Int
    var name : String
    var email : String
}
