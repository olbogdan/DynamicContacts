//
//  ContactDTO.swift
//  DynamicContacts
//
//  Created by bogdanov on 12.04.21.
//

import Foundation

struct Contact: Codable, Identifiable {
    let id: Int
    let firstName: String
    let email: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case email
        case avatar
    }
}

struct Contacts: Codable {
    let data: [Contact]
}
