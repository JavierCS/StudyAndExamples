import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        #if DEBUGTwo
        self.title = "Two"
        #elseif DEBUG
        self.title = "One"
        #endif
    }
}

