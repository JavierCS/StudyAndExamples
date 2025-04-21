//
//  WalletItemsView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI
import SwiftData

struct WalletItemsView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var walletItems: [WalletItem]
    
    var body: some View {
        List(walletItems) { walletItem in
            WalletItemView(walletItem: walletItem)
                .listRowSeparator(.hidden)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        delete(walletItem: walletItem)
                    } label: {
                        Image(systemName: "trash")
                    }

                }
        }
        .listStyle(.plain)
        .navigationTitle("Wallet Items")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    createWalletItem()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
    
    func createWalletItem() {
        let walletItem = WalletItem(
            id: UUID(),
            balance: 0,
            canBeDeleted: true,
            color: nil,
            colorName: "accent",
            creditLimit: 0,
            image: nil,
            imageName: "apple.logo",
            interestRate: 0,
            name: "BAZ",
            type: "debt"
        )
        modelContext.insert(walletItem)
    }
    
    func delete(walletItem: WalletItem) {
        modelContext.delete(walletItem)
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: WalletItem.self, inMemory: true)
}
