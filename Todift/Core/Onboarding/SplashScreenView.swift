//
//  SplashScreenView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 21.01.2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 1.0
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color.purple
                    .ignoresSafeArea()
                VStack {
                    Image("splash-screen-logo")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.5
                        self.opacity = 1
                    }
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
