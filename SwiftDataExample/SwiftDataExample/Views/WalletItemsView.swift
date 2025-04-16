//
//  WalletItemsView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI

struct WalletItemsView: View {
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List {
            
        }
        .navigationTitle("Wallet Items")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: WalletItem.self, inMemory: true)
}
