//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Denis Kazarin on 22.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {
    
    public var song: ITunesSong
    
    lazy var songViewController = SongDetailMainViewController(song: song)
    
    private let imageDownloader = ImageDownloader()
    
    private var songDetailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    // MARK: - Lifecycle
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    override func loadView() {
//        super.loadView()
//        self.view = AppDetailView()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.configureNavigationController()
//        self.downloadImage()
        
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        view.backgroundColor = .white
        
        addSongViewController()
       
    }
    
    private func addSongViewController() {
        self.addChild(songViewController)
        self.view.addSubview(songViewController.view)
        songViewController.didMove(toParent: self)
        
        songViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            songViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            songViewController.view.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            songViewController.view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

}
