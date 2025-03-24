//
//  ContentView.swift
//  CrashTest
//
//  Created by Serhii Molodets on 24.03.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("App Crash") {
                let nilValue: String? = nil
                print(nilValue!)
            }
            .padding()
            Button("App Send Error Log") {
                AppLogger.shared.error(NSError(domain: "test error for logger", code: 1000))
            }
            .padding()
            Button("App Send Warn Log") {
                AppLogger.shared.warn("App warn")
            }
            .padding()
            Button("App Send Info Log") {
                AppLogger.shared.info("App info")
            }
            .padding()
        }
        .padding()
        .task {
           let characters = try? await RickAndMortyAPI.shared.fetchCharacters()
            print(characters)
        }
    }
}
