import Foundation
import UIKit

class JCSPieChartConfiguration {
    /// Usa ese inicializador si deseas modificar individualmente las propiedades de la gráfica
    init() {}
    
    /// Usa este inicializador si deseas utilizar un estilo predeterminado
    init(style: JCSPieChartStyle) {
        chartStyle = style
        
        switch style {
        case .pie:
            isDrawIconsEnabled = true
        case .donut:
            configureForDonut()
        case .textDonut(let lightText, let darkText):
            configureForDonut()
            setAttributedText(using: lightText, and: darkText)
        case .attributedDonut(let attributedText):
            configureForDonut()
            centerAttributedString = attributedText
        }
    }
    
    func configureForDonut() {
        isDrawHoleEnabled = true
        isDrawCenterTextEnabled = true
        holeRadiusPercent = 0.5
        holeColor = .clear
    }
    
    func setAttributedText(using lightText: String, and darkText: String) {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let centerLightText = NSMutableAttributedString(string: lightText, attributes: [
            NSAttributedString.Key.foregroundColor: centerLightTextColor,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        
        let centerDarkText = NSMutableAttributedString(string: darkText, attributes: [
            NSAttributedString.Key.foregroundColor: centerDarkTextColor,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold),
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        
        centerLightText.append(centerDarkText)
        
        centerAttributedString = centerLightText
    }
    
    /// Estilo de la gráfica
    private var chartStyle: JCSPieChartStyle?
    
    /// Permite que el usuario pueda tener interacción con la gráfica como seleccionar rebanadas y girar la gráfica
    var isUserInteractionEnabled: Bool = false
    
    /// Te permite girar la gráfica
    var isRotationEnabled: Bool = false
    
    /// Te permite agrandar las rebanadas al ser seleccionadas
    var isHighlighPerTapEnabled: Bool = false
    
    /// Te permite dibujar la nomenclatura de los colores de la gráfica
    var isLegendEnabled: Bool = false
    
    /// Te permite dibujar el nombre de cada entrada dentro de su respectiva rebanada dentro de la gráfica
    var isDrawEntryLabelsEnabled: Bool = false
    
    /// Te permite dibujar el valor de cada entrada dentro de su respectiva rebanada dentro de la gráfica
    var isDrawEntryValuesEnabled: Bool = false
    
    /// Te permite dibujar el valor de cada entrada dentro de su respectiva rebanada dentro de la gráfica como un porcentaje en lugar de su valor crudo
    var isUsePercentValuesEnabled = false
    
    /// Te permite dibujar los íconos de cada entrada dentro de su rebanada en la gráfica
    var isDrawIconsEnabled = false
    
    /// Te permite dibujat un círculo al centro de la gráfica para poner algún texto adicional
    var isDrawCenterTextEnabled: Bool = false
    
    /// Texto al centro de la gráfica
    var centerAttributedString: NSMutableAttributedString? = nil
    
    /// El color del texto de arriba al centro de la gráfica. Solo funciona con el estilo textDonut(lightText: String, darkText: String)
    var centerLightTextColor: UIColor = .black
    
    /// El color del texto de abajo al centro de la gráfica. Solo funciona con el estilo textDonut(lightText: String, darkText: String)
    var centerDarkTextColor: UIColor = .black
    
    /// Dibuja un círculo al centro de la gráfica para darle una apariencia de dona o para utilizar un texto central
    var isDrawHoleEnabled: Bool = false
    
    /// Color del círculo al centro de la gráfica
    var holeColor: UIColor = .clear
    
    /// Define el tamaño del círculo al centro de la gráfica en proporción al radio del círculo, por default es la mitad (0.5)
    var holeRadiusPercent: CGFloat = 0.0
    
    /// Define el color del anillo que rodea al centro de la gráfica
    var ringColor: UIColor?
}
