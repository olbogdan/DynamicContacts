//
//  UserModel.swift
//  DynamicContacts
//
//  Created by bogdanov on 12.04.21.
//

import Foundation

struct ContactViewModel: Identifiable {
    var id: Int
    let username, email, imageURL: String
}
