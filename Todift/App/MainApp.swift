//
//  MainApp.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 6.01.2024.
//

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import GoogleMobileAds
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Google ADS
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}

@main
struct MainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("needs_onboarding") var needsOnboarding: Bool = true
    init() {
        FirebaseApp.configure()
    }

    @StateObject var viewModel = AuthViewModel()
    @StateObject var vmTodo = TodoViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SplashScreenView()
                    .fullScreenCover(isPresented: $needsOnboarding, onDismiss: {
                        needsOnboarding = false
                    }, content: {
                        OnboardingView()
                    })
            }
            .environmentObject(viewModel)
            .environmentObject(vmTodo)
        }
    }
}
