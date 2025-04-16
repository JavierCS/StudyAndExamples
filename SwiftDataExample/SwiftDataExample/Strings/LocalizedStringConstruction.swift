//
//  StringExtension.swift
//  Pigget
//
//  Created by Javier Cruz Santiago on 09/01/25.
//

import Foundation

extension String {
    init(_ key: String, in table: LocalizedTables) {
        self.init()
        self = table.localizedString(for: key)
    }
}
