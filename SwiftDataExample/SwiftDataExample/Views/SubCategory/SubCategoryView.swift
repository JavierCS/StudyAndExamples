//
//  SubCategoryView.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import SwiftUI

struct SubCategoryView: View {
    var subCategory: SubCategory?
    
    var body: some View {
        GroupBox {
            VStack {
                HStack {
                    Text("Id:")
                        .font(.headline)
                    Spacer()
                }
                Text(subCategory?.id.uuidString ?? "nil")
                    .foregroundStyle(.secondary)
                HStack {
                    Text("Name:")
                        .font(.headline)
                    Spacer()
                    Text(subCategory?.name ?? "nil")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Text("Localized Name Id:")
                        .font(.headline)
                    Spacer()
                    Text(subCategory?.localizedNameId ?? "nil")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Text("Image Name:")
                        .font(.headline)
                    Spacer()
                    Text(subCategory?.imageName ?? "nil")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Text("Is Favorite:")
                        .font(.headline)
                    Spacer()
                    Text("\(subCategory?.isFavorite ?? false)")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Text("Can Be Deleted:")
                        .font(.headline)
                    Spacer()
                    Text("\(subCategory?.canBeDeleted ?? false)")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Text("Usage Count:")
                        .font(.headline)
                    Spacer()
                    Text("\(subCategory?.usageCount ?? 0)")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Text("Category Localized Name Id:")
                        .font(.headline)
                    Spacer()
                    Text(subCategory?.category?.localizedNameId ?? "nil")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    SubCategoryView()
}
