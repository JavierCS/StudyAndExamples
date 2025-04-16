//
//  SubscriptionsView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI

struct SubscriptionsView: View {
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List {
            
        }
        .navigationTitle("Subscriptions")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: Subscription.self, inMemory: true)
}
