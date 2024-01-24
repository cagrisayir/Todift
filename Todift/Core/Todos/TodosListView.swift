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
                
            } else {
                Text("No Todo")
                Button("Add todo") {
                    Task {
                        await vm.addTodo()
                    }
                }
            }
        }.onAppear(perform: {
            Task {
                await vm.fetchTodos()
            }
        })
    }
}
