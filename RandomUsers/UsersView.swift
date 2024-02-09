//
//  ContentView.swift
//  RandomUsers
//
//  Created by Александр Кириченко on 02.05.2023.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            List(userData.users) { user in
                HStack {
                    AsyncImage(url: URL(string: user.picture.thumbnail) , content: { image in
                        image.clipShape(Circle())
                    }, placeholder: {
                        Image(systemName: "person")
                            .frame(width: 50, height: 50, alignment: .center)
                    })
                    Text(user.fullname)
                }
            }
        }
        .navigationTitle("Random Users")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UsersView()
        }
    }
}
