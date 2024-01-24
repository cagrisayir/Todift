//
//  TodosListView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 24.01.2024.
//

import Firebase
import FirebaseFirestoreSwift
import SwiftUI

@MainActor
struct TodosListView: View {
    @StateObject var vm: TodoViewModel = TodoViewModel()

    var body: some View {
        VStack {
            ForEach(vm.items) { item in
                Text(item.title)
            }
        }
    }
}
