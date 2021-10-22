//
//  SongDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Denis Kazarin on 22.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailView: UIView {
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.addSubview(imageView)
        self.addSubview(trackLabel)
        self.addSubview(artistLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            
            trackLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            trackLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16),
            trackLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            artistLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: 6),
            artistLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16),
            artistLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
}
