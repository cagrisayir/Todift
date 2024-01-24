//
//  Todo.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 21.01.2024.
//

import Foundation

class Todo: Identifiable, Codable {
    var id: String
    var title: String
    var creationDate: Date
    var isDone: Bool
    var flag: Flags

    init(title: String, flag: Flags) {
        id = UUID().uuidString
        self.title = title
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

extension Todo {
    func todoToDict() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            return dictionary ?? [:]
        } catch {
            print("Error while encoding todo \(error.localizedDescription)")
            return [:]
        }
    }
}
