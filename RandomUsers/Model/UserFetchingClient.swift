//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Александр Кириченко on 02.05.2023.
//

import Foundation

struct UserFetchingClient {
    
    static private var url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    static func getUsers() async throws -> [User] {
        async let (data, _) = URLSession.shared.data(from: url)
        let responce = try await JSONDecoder().decode(Responce.self, from: data)
        return responce.users
    }
    
}
