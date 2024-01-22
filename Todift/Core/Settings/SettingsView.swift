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
    var body: some View {
        ZStack {
            Picker(selection: $activeAppIcon) {
                let customIcons: [String] = ["AppIcon", "AppIcon 1"]

                ForEach(customIcons, id: \.self) { icon in
                    Text(icon)
                        .tag(icon)
                }
            } label: {
            }
        }.onChange(of: activeAppIcon, { _, newValue in
            UIApplication.shared.setAlternateIconName(newValue)
        })
    }
}

#Preview {
    SettingsView()
}
