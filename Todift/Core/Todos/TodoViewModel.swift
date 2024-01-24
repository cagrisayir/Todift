//
//  TodoViewModel.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 24.01.2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

@MainActor
class TodoViewModel: ObservableObject {
    @Published var todos: [Todo]?

    init() {
        Task {
            await fetchTodos()
        }
    }

    func fetchTodos() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }

        let currentUser = try? snapshot.data(as: User.self)
        todos = currentUser?.todos
    }
//
//    func addTodo() async {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let newTodo = Todo(name: "Yeni yapilacak", flag: Flags.important)
//        todos.append(newTodo)
//        do {
//            let encodedtd = try Firestore.Encoder().encode(newTodo)
//            try await Firestore.firestore().collection("users").document(uid).collection("todos").addDocument(data: encodedtd)
//
//            await fetchTodos()
//        } catch {
//            print(error)
//        }
//    }
}
