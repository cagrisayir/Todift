//
//  TodoViewModel.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 24.01.2024.
//

import Firebase
import FirebaseFirestore
import Foundation

@MainActor
class TodoViewModel: ObservableObject {
    let db = Firestore.firestore()

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

        } catch {
            print("Error accured in addTodo \(error)")
        }
    }

    func changeToDone(item: Todo) {
        var itemCopy = item
        itemCopy.changeDone(!item.isDone)

        guard let uid = Auth.auth().currentUser?.uid else { return }

        db.collection("users").document(uid).collection("todos").document(itemCopy.id).setData(itemCopy.todoToDict())
    }

    func delete(id: String) {
        guard let uId = Auth.auth().currentUser?.uid else { return }
        db
            .collection("users")
            .document(uId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
