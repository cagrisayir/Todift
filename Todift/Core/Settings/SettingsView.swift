//
//  SettingsView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import SwiftUI

struct SettingsView: View {
    // For storing currently active App Icon
    @AppStorage("active_icon") var activeAppIcon: String = "AppIcon"
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        List {
            Section {
                HStack {
                    ZStack {
                        Circle()
                            .foregroundStyle(.gray)
                            .frame(width: 85)
                        Text(viewModel.currentUser?.fullname.firstLetters() ?? "")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    VStack(alignment: .leading, spacing: 20) {
                        Text(viewModel.currentUser?.fullname ?? "User name")
                        Text(viewModel.currentUser?.email ?? "Email")
                    }
                }
            }
            Section {
                Picker(selection: $activeAppIcon) {
                    let customIcons: [String] = ["AppIcon", "AppIcon 1"]

                    ForEach(customIcons, id: \.self) { icon in
                        Text(icon)
                            .tag(icon)
                    }
                } label: {
                    Text("Choose the app icon")
                }
            }.onChange(of: activeAppIcon, { _, newValue in
                UIApplication.shared.setAlternateIconName(newValue)
            })

            Section {
                Button("Logout") {
                    try? viewModel.signOut()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
