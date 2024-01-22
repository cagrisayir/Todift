//
//  ContentView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 6.01.2024.
//

import GoogleMobileAds
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Content View")
            AdBannerView(adUnitID: "ca-app-pub-1340406174185898/6639745137").frame(height: 50)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
