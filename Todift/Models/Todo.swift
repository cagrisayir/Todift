//
//  Todo.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 21.01.2024.
//

import Foundation

struct Todo: Identifiable, Codable {
    let id: String
    let title: String
    let creationDate: TimeInterval
    var isDone: Bool
    let flag: Flags

    mutating func changeDone(_ state: Bool) {
        isDone = state
    }

    init(title: String, flag: Flags) {
        id = UUID().uuidString
        self.title = title
        creationDate = Date().timeIntervalSince1970
        isDone = false
        self.flag = flag
    }
}

enum Flags: Codable, CaseIterable, Identifiable, CustomStringConvertible {
    case important
    case normal
    case notimportant

    var id: Self { self }

    var description: String {
        switch self {
        case .important:
            return "Important"
        case .normal:
            return "Normal"
        case .notimportant:
            return "Not Important"
        }
    }
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

    static func fromDictionary(_ dictionary: [String: Any]) -> Todo? {
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            let todo = try JSONDecoder().decode(Todo.self, from: data)
            return todo
        } catch {
            print("Error decoding dictionary to Todo: \(error.localizedDescription)")
            return nil
        }
    }
}
