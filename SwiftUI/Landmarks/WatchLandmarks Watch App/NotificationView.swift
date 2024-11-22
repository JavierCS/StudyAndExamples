//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Javier Cruz Santiago on 22/11/24.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
    }
}

#Preview {
    NotificationView()
}

/// This shows a preview of the notification view when data is provided. Because any notification value can be nil, it’s useful to keep the default preview of the notification view when no data is provided.
#Preview {
    NotificationView(
        title: "TurtleRock",
        message: "You are within 5 miles of Turtle Rock.",
        landmark: ModelData().landmarks[0]
    )
}
