//
//  DateExtension.swift
//  SwiftDataExample
//
//  Created by Javier Cruz Santiago on 15/04/25.
//

import Foundation

public enum SSUDateError: String, Error {
    case cantGetDay
    case cantGetMonth
    case cantGetYear
}

extension Date {
    func monthYearBasedId() throws -> String {
        let components = Calendar.current.dateComponents([.month, .year], from: self)
        guard let month = components.month else { throw SSUDateError.cantGetMonth }
        let twoDigitsMonth = try month.twoDigitString()
        guard let year = components.year else { throw SSUDateError.cantGetYear }
        return "\(year)\(twoDigitsMonth)"
    }
}
