//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Javier Cruz Santiago on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
        
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
