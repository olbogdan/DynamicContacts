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
    @State var indexSet: IndexSet = []
    @State var contacts: [ContactViewModel] = []
    @State var isPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    NavigationLink(destination: ContactDetailView(contact: contact)) {
                        ContactRow(contact: contact)
                    }
                }.onDelete { indexSet in
                    self.indexSet = indexSet
                    isPresented = true
                }.alert(isPresented: $isPresented) {
                    Alert(
                        title: Text("Delete contact"),
                        message: Text("Are you sure you want to delete this ? This can't be undone..."),
                        primaryButton: .cancel(),
                        secondaryButton: .destructive(
                            Text("Delete"),
                            action: {
                                withAnimation {
                                    removeItem(at: indexSet)
                                }
                            }
                        )
                    )
                }
            }
            .navigationBarTitle(Text("Contacts"))
            .onAppear {
                contactsManager.getContacts { contacts in
                    self.contacts.removeAll()
                    self.contacts.append(contentsOf: contacts)
                }
            }
        }
    }

    private func removeItem(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
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
                Text(contact.email)
            }.padding(.leading, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
