//
//  Subscription.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import Foundation
import SwiftData

@Model
final class Subscription {
    @Attribute(.unique) var id: UUID
    @Attribute(.externalStorage) var colorData: Data?
    var firstPaymentDate: Date
    var frequency: Int
    var frequencyType: String
    var iconName: String?
    var iconOrigin: String
    var isActive: Bool
    var monthlySpending: Decimal
    var name: String?
    var price: Decimal
    var sixMonthlySpending: Decimal
    var subscriptionDescription: String?
    var threeMonthlySpending: Decimal
    var yearlySpending: Decimal
    
    init(id: UUID, colorData: Data? = nil, firstPaymentDate: Date, frequency: Int, frequencyType: String, iconName: String? = nil, iconOrigin: String, isActive: Bool, monthlySpending: Decimal, name: String? = nil, price: Decimal, sixMonthlySpending: Decimal, subscriptionDescription: String? = nil, threeMonthlySpending: Decimal, yearlySpending: Decimal) {
        self.id = id
        self.colorData = colorData
        self.firstPaymentDate = firstPaymentDate
        self.frequency = frequency
        self.frequencyType = frequencyType
        self.iconName = iconName
        self.iconOrigin = iconOrigin
        self.isActive = isActive
        self.monthlySpending = monthlySpending
        self.name = name
        self.price = price
        self.sixMonthlySpending = sixMonthlySpending
        self.subscriptionDescription = subscriptionDescription
        self.threeMonthlySpending = threeMonthlySpending
        self.yearlySpending = yearlySpending
    }
}
