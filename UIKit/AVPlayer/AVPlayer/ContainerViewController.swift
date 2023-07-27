import UIKit
import AVKit
import AVFoundation

class ContainerViewController: UIViewController {
    var path: String!
    
    //MARK: - Logic Vars
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for children in self.children {
            if let videoViewController = children as? VideoViewController {
                videoViewController.path = self.path
                videoViewController.videoDelegate = self
            }
        }
    }
    
    //MARK: - UIElements Actions
    @IBAction func didTouchBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ContainerViewController: VideoViewControllerDelegate {
    func didFinishedVideoReproduction(for videoViewController: VideoViewController) {
        self.containerView.removeFromSuperview()
    }
}

