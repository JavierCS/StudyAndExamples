import UIKit
import AVKit

protocol VideoViewControllerDelegate: AnyObject {
    func didFinishedVideoReproduction(for videoViewController: VideoViewController)
}

class VideoViewController: AVPlayerViewController {
    var path: String!
    weak var videoDelegate: VideoViewControllerDelegate?
    
    //MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.showsPlaybackControls = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.playVideo()
    }
    
    //MARK: - Video Management
    func playVideo() {
        guard let bundleUrl = Bundle.main.path(forResource: "Videos", ofType: "Bundle") else {
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: bundleUrl + path))
        self.player = player
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        
        self.player?.play()
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.videoDelegate?.didFinishedVideoReproduction(for: self)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    }
}
