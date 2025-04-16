//
//  SubCategoriesView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI
import SwiftData

struct SubCategoriesView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var subCategories: [SubCategory]
    
    var body: some View {
        List(subCategories) { subCategory in
            SubCategoryView(subCategory: subCategory)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationTitle("Sub Categories")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: SubCategory.self, inMemory: true)
}
