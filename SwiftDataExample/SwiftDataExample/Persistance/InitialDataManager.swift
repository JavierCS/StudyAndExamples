//
//  InitialDataManager.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import Foundation
import SwiftData

@MainActor
final class InitialDataManager {
    static let shared = InitialDataManager()
    
    private init() {}
    
    func loadInitialData(using container: ModelContainer) throws {
        if UserDefaults.standard.bool(forKey: UDKey.haveTheInitialDataBeenSaved.rawValue) { return }
        guard let initialDataUrl = Bundle.main.url(forResource: "InitialData", withExtension: "json"),
              let initialData = try? Data(contentsOf: initialDataUrl),
              let initialDataDictionary = try? JSONSerialization.jsonObject(with: initialData) as? [String: Any] else {
            throw InitialDataManagementError.cantLoadInitialDataDictionary
        }
        try createCurrentPeriod(using: container)
        try createAndSaveInitialCategories(from: initialDataDictionary, using: container)
        UserDefaults.standard.set(true, forKey: UDKey.haveTheInitialDataBeenSaved.rawValue)
    }
    
    private func createCurrentPeriod(using container: ModelContainer) throws {
        guard let periodId = try? Date().monthYearBasedId() else {
            throw PeriodManagementError.cantCreatePeriod
        }
        let period = createPeriod(using: periodId)
        container.mainContext.insert(period)
        debugPrint("Created initial period under id: \(periodId)")
    }
    
    func createPeriod(using id: String) -> Period {
        return Period(
            id: id, balance: 0.0,
            revenues: 0.0,
            expenses: 0.0,
            transferBetweenOwnAccounts: 0.0,
            transactionsCount: 0
        )
    }
    
    func createAndSaveInitialCategories(from dictionary: [String: Any], using container: ModelContainer) throws {
        guard let categoriesData = dictionary.dictionaryArray(for: "categories") else { throw InitialDataManagementError.categoriesReadingError }
        try categoriesData.forEach { categoryData in
            guard let id = categoryData.string(for: "id"),
                  let uuidId = UUID(uuidString: id),
                  let localizedNameId = categoryData.string(for: "localizedNameId"),
                  let subCategoriesData = categoryData.dictionaryArray(for: "subCategories") else {
                throw InitialDataManagementError.subCategoriesReadingError
            }
            let category = Category(
                id: uuidId,
                name: nil,
                localizedNameId: localizedNameId,
                color: nil,
                colorName: categoryData.string(for: "colorName")
            )
            container.mainContext.insert(category)
            debugPrint("Created \(category.name ?? "nil")")
            try createAndSaveInitialSubCategories(using: subCategoriesData, forCategory: category, using: container)
        }
    }
    
    private func createAndSaveInitialSubCategories(using subCategoriesData: [[String: Any]], forCategory category: Category, using container: ModelContainer) throws {
        try subCategoriesData.forEach { subCategoryData in
            guard let id = subCategoryData.string(for: "id"),
                  let uuidId = UUID(uuidString: id),
                  let imageName = subCategoryData.string(for: "imageName"),
                  let localizedNameId = subCategoryData.string(for: "localizedNameId") else {
                throw InitialDataManagementError.subCategoriesReadingError
            }
            let subCategory = SubCategory(
                id: uuidId,
                name: nil,
                localizedNameId: localizedNameId,
                imageName: imageName,
                isFavorite: false,
                usageCount: 0,
                category: category
            )
            container.mainContext.insert(subCategory)
            debugPrint("- Created Sub Category \(subCategory.name ?? "nil")")
        }
    }
}
