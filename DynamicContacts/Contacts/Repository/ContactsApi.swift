//
//  ContactsApi.swift
//  DynamicContacts
//
//  Created by bogdanov on 12.04.21.
//

import Foundation

protocol ContactsApi {
    func getContacts(completion: @escaping (Contacts) -> ())
}

class RemoteContactsApi: ContactsApi {
    func getContacts(completion: @escaping (Contacts) -> ()) {
        // MARK: store urls somewhere else

        guard let contactsURL = URL(string: "https://reqres.in/api/users") else { return }

        URLSession.shared.dataTask(with: contactsURL) { data, _, _ in
            let contacts = try! JSONDecoder().decode(Contacts.self, from: data!)
            print(contacts)
            DispatchQueue.main.async {
                completion(contacts)
            }
        }
        .resume()
    }
}
