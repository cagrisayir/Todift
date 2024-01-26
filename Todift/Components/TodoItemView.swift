//
//  TodoItemView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 25.01.2024.
//

import SwiftUI

struct TodoItemView: View {
    @State var todo: Todo
    @EnvironmentObject var vmTodo: TodoViewModel

    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    vmTodo.changeToDone(for: todo.id)
                    todo.isDone.toggle()

                }, label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.white)
                            .frame(height: 21)
                            .overlay {
                                if todo.isDone {
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                        .foregroundStyle(.green)
                                }
                            }
                    }
                })

                Text(todo.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .padding()
            Spacer()

            VStack {
                Text("\(Date(timeIntervalSince1970: todo.creationDate).formatted(date: .abbreviated, time: .shortened))")
                    .foregroundStyle(.white)

                Text(todo.flag.description)
                    .foregroundStyle(todo.flag == .important ? .red : .white)
            }
            .padding(.horizontal, 5)
        }
        .background(.orange)
    }
}

#Preview {
    TodoItemView(todo: Todo(title: "First Todo", flag: .important))
}
