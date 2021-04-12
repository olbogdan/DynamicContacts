//
//  ContactsManager.swift
//  DynamicContacts
//
//  Created by bogdanov on 12.04.21.
//

import Foundation

class ContactsManager {
    // how to do late init of properties?
    let contactsApi: ContactsApi

    // MARK: use some Dependency injection

    init() {
        contactsApi = RemoteContactsApi()
    }

    func getContacts(completion: @escaping ([ContactViewModel]) -> ()) {
        contactsApi.getContacts { contacts in
            let viewModels = contacts.data.map {
                ContactViewModel(id: $0.id,
                                 username: $0.firstName,
                                 message: $0.email,
                                 imageURL: $0.avatar)
            }
            completion(viewModels)
        }
    }
}
