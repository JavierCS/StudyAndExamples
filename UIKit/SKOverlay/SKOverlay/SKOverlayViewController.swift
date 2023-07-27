import UIKit
import StoreKit

class SKOverlayViewController: UIViewController {
    @IBOutlet weak var imvBackground: UIImageView!
    @IBOutlet weak var lblAppName: UILabel!
    @IBOutlet weak var imvAppLogo: UIImageView!
    @IBOutlet weak var aiProgress: UIActivityIndicatorView!
    @IBOutlet weak var vSeeInAppStore: UIView!
    @IBOutlet weak var btnSeeInAppStore: UIButton!
    
    public var appData: AppData!
    
    private var request: SKProductsRequest!
    
    //MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfiguration()
        self.loadAppData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 14.0, *) {
            self.displayOverlay()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if #available(iOS 14.0, *) {
            self.dismissOverlay()
        }
    }
    
    //MARK: - UIElements Actions
    @IBAction func didTouchSeeInAppStoreButton(_ sender: UIButton) {
        self.openAppUrl()
    }
    
    //MARK: - Utils Functions
    func initialConfiguration() {
        self.imvAppLogo.layer.cornerRadius = 50
        self.btnSeeInAppStore.backgroundColor = UIColor.systemBlue
        self.btnSeeInAppStore.setTitleColor(UIColor.white, for: .normal)
        self.btnSeeInAppStore.layer.cornerRadius = 15
        self.btnSeeInAppStore.layer.shadowOffset = CGSize.zero
        self.btnSeeInAppStore.layer.shadowColor = UIColor.black.cgColor
        self.btnSeeInAppStore.layer.shadowRadius = 15
        self.btnSeeInAppStore.layer.shadowOpacity = 0.25
        if #available(iOS 14.0, *) {
            self.vSeeInAppStore.isHidden = true
            self.aiProgress.isHidden = false
            self.aiProgress.startAnimating()
        } else {
            self.vSeeInAppStore.isHidden = false
            self.aiProgress.isHidden = true
        }
    }
    
    func loadAppData() {
        self.imvBackground.image = self.appData.appIcon
        self.lblAppName.text = self.appData.appName
        self.imvAppLogo.image = self.appData.appIcon
        
//        self.loadStoreData()
    }
    
    func loadStoreData() {
        let productIdentifiers = Set([self.appData.appIdentifier])
        self.request = SKProductsRequest(productIdentifiers: productIdentifiers)
        self.request.delegate = self
        self.request.start()
    }
    
    //MARK: URL App Store Management
    private func openAppUrl() {
        self.openStoreProductWithiTunesItemIdentifier(appData.appIdentifier)
    }
    
    func openStoreProductWithiTunesItemIdentifier(_ identifier: String) {
        let storeViewController = SKStoreProductViewController()
        storeViewController.delegate = self
        
        self.aiProgress.isHidden = false
        self.aiProgress.startAnimating()
        
        let parameters = [ SKStoreProductParameterITunesItemIdentifier : identifier]
        storeViewController.loadProduct(withParameters: parameters) { [weak self] (loaded, error) -> Void in
            if loaded {
                // Parent class of self is UIViewContorller
                self?.aiProgress.stopAnimating()
                self?.aiProgress.isHidden = true
                self?.present(storeViewController, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: SKOverlay Management
    @available(iOS 14.0, *)
    func displayOverlay() {
        guard let scene = view.window?.windowScene else { return }
        let config = SKOverlay.AppConfiguration(appIdentifier: self.appData.appIdentifier, position: .bottom)
        let overlay = SKOverlay(configuration: config)
        overlay.delegate = self
        overlay.present(in: scene)
    }
    
    @available(iOS 14.0, *)
    func dismissOverlay() {
        guard let scene = view.window?.windowScene else { return }
        SKOverlay.dismiss(in: scene)
    }
}

//MARK: - SKOverlayDelegate Management
@available(iOS 14.0, *)
extension SKOverlayViewController: SKOverlayDelegate {
    func storeOverlayWillStartPresentation(_ overlay: SKOverlay, transitionContext: SKOverlay.TransitionContext) {
        self.aiProgress.stopAnimating()
        self.aiProgress.isHidden = true
    }
}

extension SKOverlayViewController: SKStoreProductViewControllerDelegate {
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
//        self.dismiss(animated: true)
    }
}

//MARK: - SKProductsRequestDelegate Management
extension SKOverlayViewController: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if !response.products.isEmpty {
            let products = response.products
            // Custom method.
            print(products)
        }
        
        for invalidIdentifier in response.invalidProductIdentifiers {
            print(invalidIdentifier)
        }
    }
}

//MARK: - AppData Definition
extension SKOverlayViewController {
    public struct AppData {
        let appUrl: String
        let appIdentifier: String
        var appIcon: UIImage?
        var appName: String?
        
        public init(appUrl: String, appIdentifier: String, appIcon: UIImage? = nil, appName: String? = nil) {
            self.appUrl = appUrl
            self.appIdentifier = appIdentifier
            self.appIcon = appIcon
            self.appName = appName
        }
    }
}
