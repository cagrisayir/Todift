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
    @Published var errorString: String?

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

    func addTodo() async {
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else { return }

        // create model
        let newTodo = Todo(title: "This is the first todo", flag: .important)
        // save model
        let db = Firestore.firestore()

        do {
            try await db.collection("users")
                .document(uId)
                .collection("todos")
                .document(newTodo.id)
                .setData(newTodo.todoToDict())

        } catch {
            print("Error accured in addTodo \(error)")
            errorString = error.localizedDescription
        }
    }
}
