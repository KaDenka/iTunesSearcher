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
        return label
    }()
}
