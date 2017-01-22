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
    
    var videoName: String!
    var playerLayer: AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if let path = Bundle.main.path(forResource: videoName, ofType: "mov") {
            let url = NSURL(fileURLWithPath: path)
            let player = AVPlayer(url: url as URL)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.view.bounds
            self.view.layer.addSublayer(playerLayer)
            player.play()
        }
        else {
            print("Didn't find video path")
        }
    }
}
