//
//  PeriodsView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI

struct PeriodsView: View {
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List {
            
        }
        .navigationTitle("Periods")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: Period.self, inMemory: true)
}
