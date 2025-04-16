//
//  LocalizedTables.swift
//  PFM
//
//  Created by Javier Cruz Santiago on 31/07/24.
//

import Foundation

extension String {
    static let categories = "Categories"
    static let commons = "Commons"
    static let home = "Home"
    static let permissions = "Permissions"
    static let transactions = "Transactions"
    static let wallet = "Wallet"
    static let subscriptions = "Subscriptions"
}

enum LocalizedTables: String {
    case Categories
    case Commons
    case Home
    case Permissions
    case Subscriptions
    case Transactions
    case Wallet
    
    func localizedString(for key: String, comment: String = "") -> String {
        return NSLocalizedString(
            key,
            tableName: self.rawValue,
            bundle: .main,
            comment: comment
        )
    }
}
