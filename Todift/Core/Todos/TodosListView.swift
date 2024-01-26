//
//  TodosListView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 24.01.2024.
//

import Firebase
import FirebaseFirestoreSwift
import SwiftUI

struct TodosListView: View {
//    @EnvironmentObject var vmTodo: TodoViewModel
    @FirestoreQuery(collectionPath: "users") var items: [Todo]
    @State var addTodoSheet: Bool = false

    init(userId: String) {
        _items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }

    var body: some View {
        VStack {
            HStack {
                Text("Todos")
                    .font(.largeTitle)
                Spacer()
            }
            .padding()

            ScrollView {
                ForEach(items.sorted(by: { t1, t2 in
                    t1.creationDate > t2.creationDate
                })) { item in
                    TodoItemView(todo: item)
//                    Text(item.title)
                }
            }
            .onAppear(perform: {
                print(items.count)
            })
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    addTodoSheet.toggle()
                }, label: {
                    ZStack {
                        Circle()
                            .frame(width: 65)
                            .foregroundStyle(.green)

                        Image(systemName: "cross.fill")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                    }
                })
            }
        }
        .padding()
        .sheet(isPresented: $addTodoSheet, onDismiss: {
            addTodoSheet = false
        }, content: {
            AddTodoView()
                .presentationDetents([.medium])
        })
    }
}
//
//#Preview {
//    TodosListView(userId: "A1vOHzXWYnhx76YxnpuLlzUmV9n1")
//}
