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
    @Published var errorString: String?
    @Published var items: [Todo] = [Todo]()

    let db = Firestore.firestore()

    init() {
        Task {
            await fetchTodos()
        }
    }

    func addTodo(title: String, flag: Flags) async {
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else { return }

        // create model
        let newTodo = Todo(title: title, flag: flag)
        // save model

        do {
            try await db.collection("users")
                .document(uId)
                .collection("todos")
                .document(newTodo.id)
                .setData(newTodo.todoToDict())

            await fetchTodos()

        } catch {
            print("Error accured in addTodo \(error)")
            errorString = error.localizedDescription
        }
    }

    func changeToDone(for todoId: String) {
        Firestore.firestore().collectionGroup("todos").whereField("id", isEqualTo: todoId).setValue(true, forKey: "isDone")
    }

    func fetchTodos() async {
        if let snapshot = try? await Firestore.firestore().collectionGroup("todos").getDocuments() {
            for document in snapshot.documents {
                if let todo = Todo.fromDictionary(document.data()) {
                    // if id doesn't exist then fetch.
                    if items.filter({ item in
                        item.id == todo.id
                    }).isEmpty {
                        items.append(todo)
                    }
                } else {
                    print("failed to add")
                }
            }
        }
    }
}
