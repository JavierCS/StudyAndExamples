import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnInstalledApp: UIButton!
    @IBOutlet weak var btnObtainedApp: UIButton!
    @IBOutlet weak var btnNewApp: UIButton!
    
    //MARK: - Lifecycle Management
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let overlayVC = segue.destination as? SKOverlayViewController,
              let appData = sender as? SKOverlayViewController.AppData else { return }
        overlayVC.appData = appData
    }
    
    //MARK: - UIElements Actions
    @IBAction func didTouchAnyButton(_ sender: UIButton) {
        var appData: SKOverlayViewController.AppData
        if sender.isEqual(self.btnInstalledApp) {
            appData = SKOverlayViewController.AppData(appUrl: "https://apps.apple.com/us/app/apple-music/id1108187390",
                                                      appIdentifier: "1108187390",
                                                      appIcon: #imageLiteral(resourceName: "appleMusic"),
                                                      appName: "Apple Music")
        } else if sender.isEqual(self.btnObtainedApp) {
            appData = SKOverlayViewController.AppData(appUrl:"https://apps.apple.com/us/app/tetris/id1491074310",
                                                      appIdentifier: "1491074310",
                                                      appIcon: #imageLiteral(resourceName: "tetris"),
                                                      appName: "Tetris")
        } else { // Did touch btn new app
            appData = SKOverlayViewController.AppData(appUrl: "https://apps.apple.com/mx/app/twitch/id460177396",
                                                      appIdentifier: "460177396",
                                                      appIcon: #imageLiteral(resourceName: "twitch"),
                                                      appName: "Twitch")
        }
        self.performSegue(withIdentifier: "showSKOverlay", sender: appData)
    }
}

