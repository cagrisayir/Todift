//
//  MainApp.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 6.01.2024.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}

@main
struct MainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("needs_onboarding") var needsOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .fullScreenCover(isPresented: $needsOnboarding, onDismiss: {
                        needsOnboarding = false
                    }, content: {
                        OnboardingView()
                    })
            }
        }
    }
}
