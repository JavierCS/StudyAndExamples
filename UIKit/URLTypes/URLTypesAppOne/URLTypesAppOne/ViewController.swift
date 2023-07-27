import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTouchOpenAppTwoButton(_ sender: UIButton) {
        guard let appTwoUrl = URL(string: "appTwo://"),
              UIApplication.shared.canOpenURL(appTwoUrl) else {
            let alertController = UIAlertController(title: "Ups", message: "App Two no está instalada en ese dispositivo", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            self.navigationController?.present(alertController, animated: true)
            return
        }
        UIApplication.shared.open(appTwoUrl)
    }
    
}

