//
//  CategoriesView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI
import SwiftData

struct CategoriesView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var showCategoryForm: Bool = false
    
    @Query private var categories: [Category]
    
    var body: some View {
        List(categories) { category in
            CategoryView(category: category)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationTitle("Categories")
        .navigationBarTitleDisplayMode(.large)
//        .toolbar {
//            ToolbarItem(placement: .primaryAction) {
//                Button("", systemImage: "plus") {
//                    showCategoryForm.toggle()
//                }
//            }
//        }
        .sheet(isPresented: $showCategoryForm) {
            NavigationStack {
                NewCategoryView()
            }
        }
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: Category.self, inMemory: true)
}
