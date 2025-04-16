//
//  TextExtension.swift
//  Pigget
//
//  Created by Javier Cruz Santiago on 09/01/25.
//

import Foundation
import SwiftUI

extension Text {
    init (_ key: LocalizedStringKey, in table: LocalizedTables, bundle: Bundle = .main) {
        self.init(key, tableName: table.rawValue, bundle: bundle)
    }
}
