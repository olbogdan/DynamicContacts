//
//  ContactDetailView.swift
//  DynamicContacts
//
//  Created by bogdanov on 13.04.21.
//

import SwiftUI

struct ContactDetailView: View {
    var contact: ContactViewModel

    var body: some View {
        VStack {
            ImageWithURL(contact.imageURL)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.black, lineWidth: 4))
                .frame(width: 150, height: 150)
            Text(contact.username)
                .font(.title)
                .fontWeight(.medium)
            Form {
                HStack {
                    Text("email")
                    Spacer()
                    Text(contact.email)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
            }
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: ContactViewModel(
            id: 1,
            username: "Niziaminara",
            email: "itarromana@gmail.com",
            imageURL: "https://reqres.in/img/faces/3-image.jpg")
        )
    }
}
