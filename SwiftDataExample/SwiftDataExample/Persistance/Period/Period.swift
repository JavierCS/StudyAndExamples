//
//  Period.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import Foundation
import SwiftData

@Model
final class Period {
    @Attribute(.unique) var id: String
    var balance: Decimal
    var revenues: Decimal
    var expenses: Decimal
    var transferBetweenOwnAccounts: Decimal
    var transactionsCount: Int
    
    init(id: String, balance: Decimal, revenues: Decimal, expenses: Decimal, transferBetweenOwnAccounts: Decimal, transactionsCount: Int) {
        self.id = id
        self.balance = balance
        self.revenues = revenues
        self.expenses = expenses
        self.transferBetweenOwnAccounts = transferBetweenOwnAccounts
        self.transactionsCount = transactionsCount
    }
}
