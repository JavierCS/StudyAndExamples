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
        
        /// When Apple Watch receives a notification, it looks for a scene in your app associated with the notification’s category.
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
    }
}
