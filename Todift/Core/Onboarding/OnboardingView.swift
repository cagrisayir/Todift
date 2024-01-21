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
                    .padding(.top, 100)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                Spacer()
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Button("Press here to explore") {
                    dismiss()
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
