//
//  OnboardingView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 21.01.2024.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)

            VStack {
                Text("Welcome to the app")
                Spacer()
                Text("Onboarding View")
                Spacer()
                Button("Skip") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
