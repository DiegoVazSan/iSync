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
    var address : AddressModel
}

struct AddressModel : Decodable {
    var street : String
    var suite : String
    var city : String
    var zipcode : String
    var geo : GeoModel
}

struct GeoModel : Decodable {
    var lat : String
    var lng : String
}
