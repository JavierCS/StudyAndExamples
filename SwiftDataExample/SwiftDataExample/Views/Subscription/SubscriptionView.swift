//
//  SubscriptionView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 21/04/25.
//

import SwiftUI

struct SubscriptionView: View {
    var subscription: Subscription?
    
    var body: some View {
        GroupBox {
            HStack {
                Text("Subscription id:")
                    .font(.headline)
                Spacer()
                Text(subscription?.id.uuidString ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription has color data:")
                    .font(.headline)
                Spacer()
                Text("\(subscription?.colorData != nil ? true : false)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription first payment date:")
                    .font(.headline)
                Spacer()
                Text("\(subscription?.firstPaymentDate ?? Date())")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription frequency:")
                    .font(.headline)
                Spacer()
                Text("\(subscription?.frequency ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription frequency type:")
                    .font(.headline)
                Spacer()
                Text(subscription?.frequencyType ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription icon name:")
                    .font(.headline)
                Spacer()
                Text(subscription?.iconName ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription is active:")
                    .font(.headline)
                Spacer()
                Text("\(subscription?.isActive ?? false)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription monthly spending:")
                    .font(.headline)
                Spacer()
                Text("\(subscription?.monthlySpending ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription name:")
                    .font(.headline)
                Spacer()
                Text(subscription?.name ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription price:")
                    .font(.headline)
                Spacer()
                Text("\(subscription?.price ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription 6 monthly spending:")
                    .font(.headline)
                Spacer()
                Text("\(subscription?.sixMonthlySpending ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription description:")
                    .font(.headline)
                Spacer()
                Text(subscription?.subscriptionDescription ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription three monthly spending:")
                    .font(.headline)
                Spacer()
                Text("\(subscription?.threeMonthlySpending ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Subscription yearly spending:")
                    .font(.headline)
                Spacer()
                Text("\(subscription?.yearlySpending ?? 0)")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    SubscriptionView()
}
