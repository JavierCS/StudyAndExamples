//
//  PeriodView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 16/04/25.
//

import SwiftUI

struct PeriodView: View {
    var period: Period?
    
    var body: some View {
        GroupBox {
            HStack {
                Text("Period id:")
                    .font(.headline)
                Spacer()
                Text(period?.id ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Period balance:")
                    .font(.headline)
                Spacer()
                Text("\(period?.balance ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Period revenues:")
                    .font(.headline)
                Spacer()
                Text("\(period?.revenues ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Period expenses:")
                    .font(.headline)
                Spacer()
                Text("\(period?.expenses ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Period tboa:")
                    .font(.headline)
                Spacer()
                Text("\(period?.transferBetweenOwnAccounts ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Period transactions count:")
                    .font(.headline)
                Spacer()
                Text("\(period?.transactionsCount ?? 0)")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    PeriodView()
}
