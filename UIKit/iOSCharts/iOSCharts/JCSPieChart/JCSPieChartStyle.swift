import Foundation

enum JCSPieChartStyle {
    case pie
    case donut
    case textDonut(lightText: String, darkText: String)
    case attributedDonut(attributedText: NSMutableAttributedString)
}
