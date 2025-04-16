//
//  CRUDView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI

struct CRUDView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var selected: String = "home"
    
    var body: some View {
        TabView {
            Tab("Category", systemImage: "list.bullet") {
                NavigationStack {
                    CategoriesView()
                }
            }
            
            Tab("Period", systemImage: "calendar") {
                NavigationStack {
                    PeriodsView()
                }
            }
            
            Tab("SubCategory", systemImage: "list.bullet.indent") {
                NavigationStack {
                    SubCategoriesView()
                }
            }
            
            Tab("Subscription", systemImage: "tv") {
                NavigationStack {
                    SubscriptionsView()
                }
            }
            
            Tab("Transaction", systemImage: "dollarsign") {
                NavigationStack {
                    TransactionsView()
                }
            }
            
            Tab("Wallet Item", systemImage: "wallet.bifold") {
                NavigationStack {
                    WalletItemsView()
                }
            }
        }
    }
}

#Preview {
    CRUDView()
}
