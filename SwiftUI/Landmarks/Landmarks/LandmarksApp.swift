//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Javier Cruz Santiago on 05/11/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData: ModelData = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
