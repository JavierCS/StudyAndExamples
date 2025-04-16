//
//  SubCategory.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import Foundation
import SwiftData

@Model
final class SubCategory {
    @Attribute(.unique) var id: UUID
    var name: String?
    var localizedNameId: String?
    var imageName: String?
    var isFavorite: Bool
    var canBeDeleted: Bool
    var usageCount: Int
    var category: Category?
    
    init(id: UUID, name: String? = nil, localizedNameId: String? = nil, imageName: String? = nil, isFavorite: Bool, canBeDeleted: Bool = false, usageCount: Int, category: Category? = nil) {
        self.id = id
        self.name = name
        self.localizedNameId = localizedNameId
        self.imageName = imageName
        self.isFavorite = isFavorite
        self.canBeDeleted = canBeDeleted
        self.usageCount = usageCount
        self.category = category
    }
}
