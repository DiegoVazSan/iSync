//
//  UserListModel.swift
//  iSync
//
//  Created by Diego Vazquez Sanchez on 29/03/24.
//

import Foundation

struct UserListModel : Decodable {
    var data : [UserProfileModel]
}

struct UserProfileModel : Decodable {
    var id : Int
    var first_name : String
    var email : String
    var avatar : String
}
