//
//  UserData.swift
//  RandomUsers
//
//  Created by Александр Кириченко on 02.05.2023.
//

import Foundation

@MainActor
class UserData: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        Task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            let users = try await UserFetchingClient.getUsers()
            self.users = users
        }
        catch {
            fatalError("\(error)")
        }
    }
    
}
