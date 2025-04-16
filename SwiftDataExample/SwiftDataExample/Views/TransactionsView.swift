//
//  TransactionsView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI

struct TransactionsView: View {
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List {
            
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: Transaction.self, inMemory: true)
}
