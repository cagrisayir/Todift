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
            AdBannerView(adUnitID: "ca-app-pub-3940256099942544/2934735716").frame(height: 200).background(.red)
            Text("Ustumde")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
