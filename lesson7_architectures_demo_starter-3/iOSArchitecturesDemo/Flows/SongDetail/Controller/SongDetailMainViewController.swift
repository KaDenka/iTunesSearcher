//
//  SongDetailMainViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Denis Kazarin on 22.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//


import UIKit

class SongDetailMainViewController: UIViewController {
    
    private let song: ITunesSong
    private let imageDownLoader = ImageDownloader()
 //   private let appDetailVersionViewController = AppDetailVersionViewController(app: app)
    
    private var songDetailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SongDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
    }
    
    private func fillData() {
        downloadImage()
        
        songDetailView.trackLabel.text = song.trackName
        songDetailView.artistLabel.text = song.artistName
    }
    
    private func downloadImage() {
        guard let url = song.artwork else { return }
        imageDownLoader.getImage(fromUrl: url) { [weak self] image, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.songDetailView.imageView.image = image
            }
        }
    }
    
}
