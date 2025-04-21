//
//  PeriodsView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI
import SwiftData

struct PeriodsView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var periods: [Period]
    
    var body: some View {
        List(periods) { period in
            PeriodView(period: period)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationTitle("Periods")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: Period.self, inMemory: true)
}
