//
//  ContentView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 6.01.2024.
//

import GoogleMobileAds
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabView {
                    TodosListView()
                        .tabItem {
                            Text("Todos")
                        }

                    SettingsView()
                        .tabItem {
                            Text("Settings")
                        }
                }

            } else {
                LoginView()
            }
//            AdBannerView(adUnitID: "ca-app-pub-3940256099942544/2934735716").frame(height: 200)
        }
    }
}
