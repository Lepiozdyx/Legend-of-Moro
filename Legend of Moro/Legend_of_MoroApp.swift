//
//  Legend_of_MoroApp.swift
//  Legend of Moro


import SwiftUI

@main
struct Legend_of_MoroApp: App {
    @UIApplicationDelegateAdaptor(LegendOfMoroAppDelegate.self) private var appDelegate
    var body: some Scene {
        WindowGroup {
            LegendOfMoroGameInitialView()
        }
    }
}
