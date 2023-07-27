//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

/*:
 ### Description:
 
 1. Use the provided class `NetworkSimulator` to execute the `getNewText1(completion:)`
 2. Use the provided class `NetworkSimulator` to execute the `getNewText2(completion:)`
 3. After getting the 2 `String` merge the **Text1** to **Text2** and assign the result to the `UILabel` of the `ViewController`
 
 ### Hint:
 
 It's not necessary to wait for `getNewText1(completion:)` to complete in order to call `getNewText2(completion:)`
 */

class MyViewController : UIViewController {
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 200, width: 200, height: 20))
        label.text = "Hello World!"
        label.textColor = .black
        return label
    }()
    
    let networkSimulator =  NetworkSimulator()
    
    var strOne: String? {
        didSet {
            self.showStrings()
        }
    }
    
    var strTwo: String? {
        didSet {
            self.showStrings()
        }
    }
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(label)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkSimulator.getNewText1 { [weak self] (strOne) in
            guard let self = self else { return }
            self.strOne = strOne
        }
        
        networkSimulator.getNewText2 { [weak self] (strTwo) in
            guard let self = self else { return }
            self.strTwo = strTwo
        }
        
    }
    
    private func showStrings() {
        guard let strOne = self.strOne,
           let strTwo = self.strTwo else { return }
        self.label.text = strOne + strTwo
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
