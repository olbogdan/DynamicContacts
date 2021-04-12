//
//  ContentView.swift
//  DynamicContacts
//
//  Created by bogdanov on 12.04.21.
//

import SwiftUI

struct UsersView: View {
    let contacts: [ContactViewModel] = [
        .init(id: 0, username: "Tim Shiff", message: "My nice shiny new monitor stand ", imageURL: "https://i.redd.it/mn5m2km7hmv01.jpg"),
        .init(id: 1, username: "Bob Mrl", message: "Bobs bob", imageURL: "https://i.redd.it/mn5m2km7hmv01.jpg"),
        .init(id: 2, username: "Carl Lincoln", message: "Carl it is easy Carl it is easy Carl it is easy Carl it is easy Carl it is easy Carl it is easy Carl it is easyCarl it is easy Carl it is easy Carl it is easy Carl it is easy Carl it is easy Carl it is easy Carl it is easy", imageURL: "https://i.redd.it/mn5m2km7hmv01.jpg")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    UserRow(contact: contact)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow: View {
    let contact: ContactViewModel

    var body: some View {
        HStack {
            ImageWithURL(contact.imageURL)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(contact.username).font(.headline)
                Text(contact.message)
            }.padding(.leading, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
