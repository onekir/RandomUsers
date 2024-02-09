//
//  User.swift
//  RandomUsers
//
//  Created by Александр Кириченко on 02.05.2023.
//

import Foundation

struct Responce: Decodable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}

struct User: Identifiable, Decodable {
    let id: String
    let name: Name
    let picture: Picture
    
    var fullname: String {
        name.title + ". " + name.first + " " + name.last
    }
    
    init(from decoder: Decoder) throws {
        //creating a container with data map to CodingKeys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // take .name from container and create an instance of Name structure
        self.name = try container.decode(Name.self, forKey: .name)
        
        // take .login  from nested container in container using LoginInfoCodingKeys and declare a let
        let loginInfo = try container.nestedContainer(keyedBy: LoginInfoCodingKeys.self, forKey: .login)
        
        // take .uuid from loginInfo
        self.id = try loginInfo.decode(String.self, forKey: .uuid)
        
        self.picture = try container.decode(Picture.self, forKey: .picture)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case login
        case picture
    }
    
    enum LoginInfoCodingKeys: String, CodingKey {
        case uuid
    }
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}
