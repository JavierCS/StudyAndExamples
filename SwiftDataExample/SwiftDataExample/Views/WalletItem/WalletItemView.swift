//
//  WalletItemView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 21/04/25.
//

import SwiftUI

struct WalletItemView: View {
    var walletItem: WalletItem?
    
    var body: some View {
        GroupBox {
            HStack {
                Text("Id:")
                    .font(.headline)
                Spacer()
                Text(walletItem?.id.uuidString ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Balance:")
                    .font(.headline)
                Spacer()
                Text("\(walletItem?.balance ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Can be deleted:")
                    .font(.headline)
                Spacer()
                Text("\(walletItem?.canBeDeleted ?? false)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Has color data:")
                    .font(.headline)
                Spacer()
                Text("\(walletItem?.color != nil ? true : false)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Color name:")
                    .font(.headline)
                Spacer()
                Text(walletItem?.colorName ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Credit limit:")
                    .font(.headline)
                Spacer()
                Text("\(walletItem?.creditLimit ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Has image data:")
                    .font(.headline)
                Spacer()
                Text("\(walletItem?.image != nil ? true : false)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Image name:")
                    .font(.headline)
                Spacer()
                Text(walletItem?.imageName ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Interest rate:")
                    .font(.headline)
                Spacer()
                Text("\(walletItem?.interestRate ?? 0)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Name:")
                    .font(.headline)
                Spacer()
                Text(walletItem?.name ?? "nil")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Type:")
                    .font(.headline)
                Spacer()
                Text(walletItem?.type ?? "nil")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    WalletItemView()
}
