//
//  PlayerView.swift
//  VideoPlayer
//
//  Created by Diana Arsenii on 7/8/20.
//  Copyright © 2020 Diana Arsenii. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerView: UIView {
    
    private let playerLayer = AVPlayerLayer()
    private var previewTimer: Timer?
    var previewLength: Double
    
    init(frame: CGRect, url: URL, previewLength: Double) {
        self.previewLength = previewLength
        super.init(frame: frame)
        
        let player = AVPlayer(url: url)
        player.volume = 0
        player.play()
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.backgroundColor = UIColor.white.cgColor
        
        previewTimer = Timer.scheduledTimer(withTimeInterval: previewLength, repeats: true, block: { _ in player.seek(to: CMTime(seconds: 0, preferredTimescale: CMTimeScale(1)))
        })
        
        layer.addSublayer(playerLayer)
        
        
    }
    
    required init?(coder: NSCoder) {
        self.previewLength = 15
        super.init(coder: coder)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
