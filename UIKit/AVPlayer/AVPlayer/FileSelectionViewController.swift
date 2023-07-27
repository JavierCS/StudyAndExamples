import UIKit

class FileSelectionViewController: UIViewController {
    //MARK: - Logic Vars
    private var dataSource: [(section: String, files: [String])] = []
    
    //MARK: - UIElements
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialConfiguration()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let indexPath = sender as? IndexPath else { return }
        let path = "/\(dataSource[indexPath.section].section)/\(dataSource[indexPath.section].files[indexPath.row])"
        
        if let destination = segue.destination as? ContainerViewController {
            destination.path = path
        } else if let destination = segue.destination as? SubLayerViewController {
            destination.path = path
        }
    }
    
    //MARK: - Configuration
    private func initialConfiguration() {
        self.getDataSource()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellId")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func getDataSource() {
        guard let bundleUrl = Bundle.main.path(forResource: "Videos", ofType: "Bundle") else {
            return
        }
        
        FileManager.default.changeCurrentDirectoryPath(bundleUrl)
        
        guard let highResolutionFiles = FileManager.default.subpaths(atPath: FileManager.default.currentDirectoryPath + "/720p/"),
              let lowResolutionFiles = FileManager.default.subpaths(atPath: FileManager.default.currentDirectoryPath + "/480p/") else {
            return
        }
        
        self.dataSource = [
            ("720p", highResolutionFiles),
            ("480p", lowResolutionFiles)
        ]
    }
}

//MARK: - UITableViewDataSource Management
extension FileSelectionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCellId", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.section].files[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].section
    }
}

//MARK: - UITableViewDelegate Management
extension FileSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Visualización", message: "¿De qué manera quieres visualizar el video?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Content View", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "toContentView", sender: indexPath)
        }))
        alertController.addAction(UIAlertAction(title: "Sub Layer", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "toSubLayer", sender: indexPath)
        }))
        alertController.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.navigationController?.present(alertController, animated: true)
    }
}
