//
//  Category.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import Foundation
import SwiftData

@Model
final class Category {
    @Attribute(.unique) var id: UUID
    var name: String?
    var localizedNameId: String?
    @Attribute(.externalStorage) var color: Data?
    var colorName: String?
    @Relationship(deleteRule: .cascade, inverse: \SubCategory.category) var subCategories = [SubCategory]()
    
    init(id: UUID, name: String? = nil, localizedNameId: String? = nil, color: Data? = nil, colorName: String? = nil, subCategories: [SubCategory] = [SubCategory]()) {
        self.id = id
        self.name = name
        self.localizedNameId = localizedNameId
        self.color = color
        self.colorName = colorName
        self.subCategories = subCategories
    }
    
    func getName() -> String {
        if let name = self.name { return name }
        return String(localizedNameId ?? "[Category Name]", in: .Categories)
    }
}
