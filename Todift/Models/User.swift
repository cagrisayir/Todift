//
//  User.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 21.01.2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let fullname: String
    let email: String
    var todos: [Todo] = [Todo]()
}
