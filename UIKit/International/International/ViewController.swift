import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100)))
        label.textAlignment = .center
        label.text = NSLocalizedString("Hello", comment: "First Localized Greeting")
        label.textColor = .black
        label.center = view.center
        
        view.addSubview(label)
        
    }


}

