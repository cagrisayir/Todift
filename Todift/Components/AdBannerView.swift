//
//  AdBannerView.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 22.01.2024.
//

import GoogleMobileAds
import SwiftUI

// UIViewRepresentable wrapper for AdMob banner view
struct AdBannerView: UIViewRepresentable {
    // Google's for try: ca-app-pub-3940256099942544/2934735716
    let adUnitID: String
 
    func makeUIView(context: Context) -> GADBannerView {
        let bannerView = GADBannerView(adSize: GADAdSizeFromCGSize(CGSize(width: 320, height: 50))) // Set your desired banner ad size
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = (UIApplication.shared.connectedScenes.first
            as? UIWindowScene)?.windows.first?.rootViewController

        bannerView.load(GADRequest())
        return bannerView
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {}
}
