/*:
 ## Display Cities Array Challenge.
 - You are provided with a `ViewController` and an `Array` of Cities. Display the given cities array data making usage of the  `UIViewController`.
 */

import UIKit
import PlaygroundSupport

struct City {
    let name: String
    let country: String
}

class MyViewController: UITableViewController {
    let cities: [City] = [
        City(name:"Guadalajara", country: "Mexico"),
        City(name: "Berlín", country: "Alemania"),
        City(name: "Buenos Aires", country: "Argentina"),
        City(name: "Bogotá", country: "Colombia"),
        City(name: "Madrid", country: "España")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTable()
    }
    
    private func configureTable() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    }
    
}

//MARK: - UITableViewDataSourceManagement
extension MyViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].name
        cell.detailTextLabel?.text = cities[indexPath.row].country
        return cell
    }
    
    
}

//MARK: - UITableViewDelegate Management

PlaygroundPage.current.liveView = MyViewController()

