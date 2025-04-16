//
//  WalletItem.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import Foundation
import SwiftData

@Model
final class WalletItem {
    @Attribute(.unique) var id: UUID
    var balance: Decimal
    var canBeDeleted: Bool
    @Attribute(.externalStorage) var color: Data?
    var colorName: String?
    var creditLimit: Decimal?
    var image: Data?
    var imageName: String?
    var interestRate: Decimal?
    var name: String
    var type: String
    
    init(id: UUID, balance: Decimal, canBeDeleted: Bool, color: Data? = nil, colorName: String? = nil, creditLimit: Decimal? = nil, image: Data? = nil, imageName: String? = nil, interestRate: Decimal? = nil, name: String, type: String) {
        self.id = id
        self.balance = balance
        self.canBeDeleted = canBeDeleted
        self.color = color
        self.colorName = colorName
        self.creditLimit = creditLimit
        self.image = image
        self.imageName = imageName
        self.interestRate = interestRate
        self.name = name
        self.type = type
    }
}
