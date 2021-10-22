//
//  AppDetailVersionView.swift
//  iOSArchitecturesDemo
//
//  Created by Denis Kazarin on 21.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionView: UIView {
    
    private(set) lazy var whatsNewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        label.text = "Что нового"
        label.textColor = .black
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var actualVersionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var dateOfReleaseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var updatesInformationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 10
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
        self.addSubview(whatsNewLabel)
        self.addSubview(actualVersionLabel)
        self.addSubview(dateOfReleaseLabel)
        self.addSubview(updatesInformationLabel)
        
        NSLayoutConstraint.activate([
            whatsNewLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            whatsNewLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            whatsNewLabel.widthAnchor.constraint(equalToConstant: 150),
            whatsNewLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dateOfReleaseLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            dateOfReleaseLabel.leftAnchor.constraint(equalTo: whatsNewLabel.rightAnchor, constant: 20),
            dateOfReleaseLabel.widthAnchor.constraint(equalToConstant: 100),
            dateOfReleaseLabel.heightAnchor.constraint(equalToConstant: 20),
            
            actualVersionLabel.topAnchor.constraint(equalTo: dateOfReleaseLabel.bottomAnchor, constant: 10),
            actualVersionLabel.leftAnchor.constraint(equalTo: whatsNewLabel.rightAnchor, constant: 20),
            actualVersionLabel.widthAnchor.constraint(equalToConstant: 100),
            actualVersionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            updatesInformationLabel.topAnchor.constraint(equalTo: actualVersionLabel.bottomAnchor, constant: 20),
            updatesInformationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            updatesInformationLabel.widthAnchor.constraint(equalToConstant: 250),
            updatesInformationLabel.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
}
