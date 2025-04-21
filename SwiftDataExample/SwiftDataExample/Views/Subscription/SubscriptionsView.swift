//
//  SubscriptionsView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI
import SwiftData

struct SubscriptionsView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var subscriptions: [Subscription]
    
    @State private var showNewSubscriptionView: Bool = false
    
    var body: some View {
        List(subscriptions) { subscription in
            SubscriptionView(subscription: subscription)
                .listRowSeparator(.hidden)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        delete(subscription: subscription)
                    } label: {
                        Image(systemName: "trash")
                    }


                }
        }
        .listStyle(.plain)
        .navigationTitle("Subscriptions")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    createSubscription()
                } label: {
                    Label("add", systemImage: "plus")
                }
            }
        }
    }
    
    func createSubscription() {
        let subscription = Subscription(
            id: UUID(),
            colorData: nil,
            firstPaymentDate: Date(),
            frequency: 1,
            frequencyType: "monthly",
            iconName: "apple.logo",
            iconOrigin: "Apple",
            isActive: true,
            monthlySpending: 499,
            name: "Apple One",
            price: 499,
            sixMonthlySpending: 2994,
            subscriptionDescription: "Premium",
            threeMonthlySpending: 1497,
            yearlySpending: 5988
        )
        modelContext.insert(subscription)
    }
    
    func delete(subscription: Subscription) {
        modelContext.delete(subscription)
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: Subscription.self, inMemory: true)
}
