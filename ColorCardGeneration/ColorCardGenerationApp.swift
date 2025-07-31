//
//  ColorCardGenerationApp.swift
//  ColorCardGeneration
//
//  Created by Shreya Prasad on 31/07/25.
//

import SwiftUI
import SwiftData

@main
struct ColorCardGenerationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ColorRecord.self)
    }
}
