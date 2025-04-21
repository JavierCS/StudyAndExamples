//
//  TransactionView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 21/04/25.
//

import SwiftUI

struct TransactionView: View {
    var transaction: Transaction?
    
    var body: some View {
        GroupBox {
            HStack {
                Text("Id: ")
                    .font(.headline)
                Spacer()
                Text(transaction?.id.uuidString ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Amount: ")
                    .font(.headline)
                Spacer()
                Text("\(transaction?.amount ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Category id: ")
                    .font(.headline)
                Spacer()
                Text(transaction?.categoryID.uuidString ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Date: ")
                    .font(.headline)
                Spacer()
                Text("\(transaction?.date ?? Date())")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Destination: ")
                    .font(.headline)
                Spacer()
                Text(transaction?.destination.uuidString ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Note: ")
                    .font(.headline)
                Spacer()
                Text(transaction?.note ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Period id: ")
                    .font(.headline)
                Spacer()
                Text(transaction?.periodId ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Source: ")
                    .font(.headline)
                Spacer()
                Text(transaction?.source.uuidString ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Sub Category Id: ")
                    .font(.headline)
                Spacer()
                Text(transaction?.subCategoryId.uuidString ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Type: ")
                    .font(.headline)
                Spacer()
                Text("\(transaction?.transactionType ?? 0)")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    TransactionView()
}
