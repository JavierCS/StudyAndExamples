import UIKit
import AVKit

class SubLayerViewController: UIViewController {
    //MARK: - Logic Vars
    var path: String!
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer!
    
    //MARK: - Lifecycle Management
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.playVideo()
    }
    
    //MARK: - Video Management
    func playVideo() {
        guard let bundleUrl = Bundle.main.path(forResource: "Videos", ofType: "Bundle") else {
            return
        }
        
        self.player = AVPlayer(url: URL(fileURLWithPath: bundleUrl + path))
        playerLayer = AVPlayerLayer(player: player)
        self.view.layer.addSublayer(playerLayer)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        
        self.player?.play()
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        playerLayer.removeFromSuperlayer()
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    }
    
    //MARK: - UIElements Actions
    @IBAction func didTouchBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
