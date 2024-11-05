//
//  CircleImage.swift
//  Landmarks
//
//  Created by Javier Cruz Santiago on 05/11/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 10)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
