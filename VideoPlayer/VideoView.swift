//
//  VideoView.swift
//  VideoPlayer
//
//  Created by Diana Arsenii on 7/8/20.
//  Copyright © 2020 Diana Arsenii. All rights reserved.
//

import SwiftUI
import AVFoundation
import AVKit

struct VideoView: UIViewRepresentable {
    
    
    var videoURL: URL
    var previewLength: Double?
    
    func makeUIView(context: Context) ->  UIView {
        return PlayerView(frame: .zero, url: videoURL, previewLength: previewLength ?? 15)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}

struct VideoView_Previews: PreviewProvider {
    
    static var url:URL = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!
    
    static var previews: some View {
        VideoView(videoURL: url, previewLength: 15)
    }
}
