/*:
 ## Refactor Challenge
 - You are provided with a `ViewController`. The Code requires a refactor since it has been done with a bunch of bad practices.
 */

import UIKit
import PlaygroundSupport

class Controller: UIViewController {
    //MARK: - UIElements
    var tableContent: UITableView!
    
    //MARK: - Logic vars
    var wordsArray: [String] = ["Hello", "World", "I am", "A Table View"]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableContent = UITableView()
        view = tableContent
        tableContent.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        tableContent.dataSource = self
    }
}

//MARK: - UITableViewDelegate Management
extension Controller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = wordsArray[indexPath.row]
        return cell
    }
}

PlaygroundPage.current.liveView = Controller()
