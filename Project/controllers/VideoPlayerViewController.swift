//
//  VideoPlayerViewController.swift
//  Project
//
//  Created by Milton on 21/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class VideoPlayerViewController: UIViewController {
    
    var player : AVPlayer?
    @IBOutlet weak var viewPlay: UIView!
    var videoName: String!
    var playerLayer:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if let path = Bundle.main.path(forResource: videoName, ofType: "mov") {
            let url = NSURL(fileURLWithPath: path)
            player = AVPlayer(url: url as URL)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer!.frame = self.view.bounds
            self.view.layer.addSublayer(playerLayer!)
        }
        else {
            print("Didn't find video path")
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        playerLayer!.frame = self.view.bounds
    }
    
    @IBAction func play(_ sender: Any) {
        player?.play()
    }
    
    @IBAction func stop(_ sender: Any) {
        player?.pause()
    }
}
