//
//  Todo.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 21.01.2024.
//

import Foundation

@Observable
class Todo: Identifiable, Codable {
    var id: String
    var name: String
    var creationDate: Date
    var isDone: Bool
    var flag: Flags

    init(name: String, flag: Flags) {
        id = UUID().uuidString
        self.name = name
        creationDate = Date()
        isDone = false
        self.flag = flag
    }
}

enum Flags: Codable {
    case important
    case normal
    case notimportant
}
