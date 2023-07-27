import Foundation
import Charts

class JCSPieChartView: PieChartView {
    var configuration: JCSPieChartConfiguration!
    
    func configure(_ configuration: JCSPieChartConfiguration) {
        self.configuration = configuration
        readConfiguration()
    }
    
    func configure(using configuration: JCSPieChartConfiguration, andDraw entries: [JCSPieChartEntryProtocol]) {
        configure(configuration)
        draw(entries: entries)
    }
    
    func draw(entries: [JCSPieChartEntryProtocol], animated: Bool = true) {
        let pieChartEntries = entries.map { entry in
            return PieChartDataEntry(value: entry.value, label: entry.name, icon: entry.icon)
        }
        
        let pieChartColors = entries.map { $0.color }
        
        let pieChartDataSet = PieChartDataSet(entries: pieChartEntries)
        pieChartDataSet.colors = pieChartColors
        pieChartDataSet.drawValuesEnabled = configuration.isDrawEntryValuesEnabled
        pieChartDataSet.drawIconsEnabled = configuration.isDrawIconsEnabled
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        data = pieChartData
        guard animated else { return }
        animate(xAxisDuration: 0.5)
    }
    
    private func readConfiguration() {
        isUserInteractionEnabled = configuration.isUserInteractionEnabled
        rotationEnabled = configuration.isRotationEnabled
        highlightPerTapEnabled = configuration.isHighlighPerTapEnabled
        legend.enabled = configuration.isLegendEnabled
        drawEntryLabelsEnabled = configuration.isDrawEntryLabelsEnabled
        usePercentValuesEnabled = configuration.isUsePercentValuesEnabled
        drawCenterTextEnabled = configuration.isDrawCenterTextEnabled
        centerAttributedText = configuration.centerAttributedString
        drawHoleEnabled = configuration.isDrawHoleEnabled
        holeColor = configuration.holeColor
        holeRadiusPercent = configuration.holeRadiusPercent
        if let ringColor = configuration.ringColor {
            transparentCircleColor = ringColor
        }
    }
}

