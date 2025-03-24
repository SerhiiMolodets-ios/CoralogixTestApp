//
//  CrashTestApp.swift
//  CrashTest
//
//  Created by Serhii Molodets on 24.03.2025.
//

import SwiftUI

@main
struct CrashTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    AppLogger.shared.setConfig()
                }
        }
    }
}
