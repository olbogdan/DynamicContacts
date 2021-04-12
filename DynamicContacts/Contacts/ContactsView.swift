//
//  ContactsView.swift
//  DynamicContacts
//
//  Created by bogdanov on 12.04.21.
//

import SwiftUI

struct ContactsView: View {
    // MARK: use some Dependency injection

    private let contactsManager = ContactsManager()
    @State var contacts: [ContactViewModel] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    ContactRow(contact: contact)
                }
            }
            .navigationBarTitle(Text("Dynamic List"))
            .onAppear {
                contactsManager.getContacts { contacts in
                    self.contacts.append(contentsOf: contacts)
                }
            }
        }
    }
}

struct ContactRow: View {
    let contact: ContactViewModel

    var body: some View {
        HStack {
            ImageWithURL(contact.imageURL)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(contact.username)
                    .font(.headline)
                Text(contact.message)
            }.padding(.leading, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
