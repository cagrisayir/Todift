//
//  TodosListView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 24.01.2024.
//

import SwiftUI

struct TodosListView: View {
    var vm: TodoViewModel
    var body: some View {
        VStack {
            if vm.todos != nil {
                ForEach(vm.todos!, id: \.id) { todo in
                    Text(todo.name)
                }
            } else {
                Text("No Todo")
                Button("Add todo") {
                }
            }
        }.onAppear(perform: {
            Task {
                await vm.fetchTodos()
            }
        })
    }
}
