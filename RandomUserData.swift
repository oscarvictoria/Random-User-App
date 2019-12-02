//
//  RandomUserData.swift
//  Random-User-App
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct RandomUserData: Decodable {
    let results: [User]
    
}

struct User: Decodable {
    let gender: String
    let name: Name
}

struct Name: Decodable {
    let title: String
    let firstName: String
    let lastName: String
    
private enum CodingKeys: String, CodingKey {
        case title
        case firstName = "first"
        case lastName = "last"
    }
}

extension RandomUserData {
    static func getUsers(from data: Data) -> [User] {
        var users = [User]()
        
        do {
            let randomUserData = try JSONDecoder().decode(RandomUserData.self, from: data)
            users = randomUserData.results
        } catch {
            fatalError("decoding error: \(error)")
        }
    
        return users
    }
}
