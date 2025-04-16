//
//  Transaction.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import Foundation
import SwiftData

@Model
final class Transaction {
    @Attribute(.unique) var id: UUID
    var amount: Decimal
    var categoryID: UUID
    var date: Date
    var destination: UUID
    var note: String?
    var periodId: String
    var source: UUID
    var subCategoryId: UUID
    var transactionType: Int
    
    init(id: UUID, amount: Decimal, categoryID: UUID, date: Date, destination: UUID, note: String? = nil, periodId: String, source: UUID, subCategoryId: UUID, transactionType: Int) {
        self.id = id
        self.amount = amount
        self.categoryID = categoryID
        self.date = date
        self.destination = destination
        self.note = note
        self.periodId = periodId
        self.source = source
        self.subCategoryId = subCategoryId
        self.transactionType = transactionType
    }
}
