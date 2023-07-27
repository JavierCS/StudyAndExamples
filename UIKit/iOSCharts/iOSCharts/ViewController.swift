import UIKit
import Charts

struct ChartDemoStruct {
    var demoName: String
    var configuration: JCSPieChartConfiguration
    var entries: [JCSPieChartEntry]
}

class ViewController: UIViewController {
    // MARK: - UIElements
    @IBOutlet weak var stylesTable: UITableView!
    @IBOutlet weak var pieChartView: JCSPieChartView!
    
    var demoStyles: [ChartDemoStruct] = []
    
    // MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfiguration()
    }
    
    // MARK: - Configuration Management
    private func initialConfiguration() {
        stylesTable.register(UINib(nibName: "PieChartDemoTableViewCell", bundle: .main), forCellReuseIdentifier: "PieChartDemoTableViewCell")
        stylesTable.dataSource = self
        stylesTable.delegate = self
        pieChartView.configure(JCSPieChartConfiguration())
        createDemoDataSource()
        stylesTable.reloadData()
    }
    
    private func createDemoDataSource() {
        let entriesOne: [JCSPieChartEntry] = [
            JCSPieChartEntry(name: "One", value: 1.0, color: .red),
            JCSPieChartEntry(name: "Two", value: 2.0, color: .green),
            JCSPieChartEntry(name: "Three", value: 3.0, color: .blue),
            JCSPieChartEntry(name: "Four", value: 4.0, color: .yellow),
            JCSPieChartEntry(name: "Five", value: 5.0, color: .cyan),
        ]
        
        let entriesTwo: [JCSPieChartEntry] = [
            JCSPieChartEntry(name: "Five", value: 5.0, color: .cyan),
            JCSPieChartEntry(name: "Four", value: 4.0, color: .yellow),
            JCSPieChartEntry(name: "Three", value: 3.0, color: .blue),
            JCSPieChartEntry(name: "Two", value: 2.0, color: .green),
            JCSPieChartEntry(name: "One", value: 1.0, color: .red)
        ]
        
        let entriesThree: [JCSPieChartEntry] = [
            JCSPieChartEntry(name: "One", value: 1.0, color: .red),
            JCSPieChartEntry(name: "One", value: 1.0, color: .cyan),
            JCSPieChartEntry(name: "One", value: 1.0, color: .green),
            JCSPieChartEntry(name: "One", value: 1.0, color: .yellow),
            JCSPieChartEntry(name: "One", value: 1.0, color: .blue),
        ]
        
        demoStyles = [
            ChartDemoStruct(demoName: "Pie",
                            configuration: JCSPieChartConfiguration(style: .pie),
                            entries: entriesOne),
            ChartDemoStruct(demoName: "Donut",
                            configuration: JCSPieChartConfiguration(style: .donut),
                            entries: entriesTwo),
            ChartDemoStruct(demoName: "Text Donut",
                            configuration: JCSPieChartConfiguration(style: .textDonut(lightText: "Light\n", darkText: "Dark")) ,
                            entries: entriesThree)
        ]
    }
}

// MARK: - UITableViewDataSource Management
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoStyles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PieChartDemoTableViewCell", for: indexPath) as? PieChartDemoTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = demoStyles[indexPath.row].demoName
        return cell
    }
}

// MARK: - UITableViewDelegate Management
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let demoToLoad = demoStyles[indexPath.row]
        pieChartView.configure(using: demoToLoad.configuration, andDraw: demoToLoad.entries)
    }
}
