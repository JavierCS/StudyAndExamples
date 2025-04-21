//
//  TransactionsView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI
import SwiftData

struct TransactionsView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var transactions: [Transaction]
    
    var body: some View {
        List(transactions) { transaction in
            TransactionView(transaction: transaction)
                .listRowSeparator(.hidden)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        delete(transaction: transaction)
                    } label: {
                        Image(systemName: "trash")
                    }

                }
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    addTransaction()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func addTransaction() {
        let transaction = Transaction(
            id: UUID(),
            amount: 100,
            categoryID: UUID(),
            date: Date(),
            destination: UUID(),
            note: "Note",
            periodId: "202504",
            source: UUID(),
            subCategoryId: UUID(),
            transactionType: 0
        )
        modelContext.insert(transaction)
    }
    
    func delete(transaction: Transaction) {
        modelContext.delete(transaction)
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: Transaction.self, inMemory: true)
}
