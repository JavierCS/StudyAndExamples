//
//  CategoryView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI

struct CategoryView: View {
    var category: Category?
    
    var body: some View {
        GroupBox(String(category?.localizedNameId ?? "Category Name", in: .Categories)) {
            VStack {
                HStack {
                    Text("Id:")
                        .font(.headline)
                    Spacer()
                }
                Text(category?.id.uuidString ?? "nil")
                    .foregroundStyle(.secondary)
                HStack {
                    Text("Name:")
                        .font(.headline)
                    Spacer()
                    Text(category?.name ?? "nil")
                }
                HStack {
                    Text("Localized Name Id:")
                        .font(.headline)
                    Spacer()
                    Text(category?.localizedNameId ?? "nil")
                }
                HStack {
                    Text("Color Name:")
                        .font(.headline)
                    Spacer()
                    Text(category?.colorName ?? "nil")
                }
                HStack {
                    Text("Sub Categories Count:")
                        .font(.headline)
                    Spacer()
                    Text("\(category?.subCategories.count ?? 0)")
                }
            }
        }
    }
}

#Preview {
    CategoryView()
}
