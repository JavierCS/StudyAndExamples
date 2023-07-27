import Foundation
import UIKit

protocol JCSPieChartEntryProtocol {
    var name: String { get set }
    var value: Double { get set }
    var color: UIColor { get set }
    var icon: UIImage? { get set }
}

class JCSPieChartEntry: JCSPieChartEntryProtocol {
    /// Nombre de la sección
    var name: String
    /// Valor de la sección
    var value: Double
    /// Color de la sección en la gráfica
    var color: UIColor
    /// Icono de la secciónen la gráfica
    var icon: UIImage?
    
    init(name: String, value: Double, color: UIColor, icon: UIImage? = nil) {
        self.name = name
        self.value = value
        self.color = color
        self.icon = icon
    }
}
