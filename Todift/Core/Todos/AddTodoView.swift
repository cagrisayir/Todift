//
//  AddTodoView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 25.01.2024.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var vmTodo: TodoViewModel

    @State var title = ""
    @State var flag: Flags = Flags.normal

    var body: some View {
        VStack {
            HStack {
                Text("Add TODO")
                    .font(.largeTitle)
                    .fontWeight(.semibold)

                Spacer()

                Button("Add") {
                    // Add to todos
                    Task {
                        await vmTodo.addTodo(title: title, flag: flag)
                    }
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }

            InputView(text: $title, title: "Title", placeholder: "Name of the todo")

            Picker("How important is this todo", selection: $flag) {
                ForEach(Flags.allCases) { item in
                    Text(String(describing: item))
                }
            }
            .pickerStyle(.palette)
        }
        .padding()
    }
}

#Preview {
    AddTodoView()
}
