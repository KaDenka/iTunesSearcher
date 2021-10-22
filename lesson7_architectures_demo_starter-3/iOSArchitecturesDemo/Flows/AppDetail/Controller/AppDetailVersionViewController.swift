//
//  AppDetailVersionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Denis Kazarin on 21.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var appDetailVersionView: AppDetailVersionView {
        return self.view as! AppDetailVersionView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailVersionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
    }
    
    private func fillData() {
        
        appDetailVersionView.updatesInformationLabel.text = app.releaseNotes
        appDetailVersionView.actualVersionLabel.text = "Версия: " + (app.version ?? "")
        appDetailVersionView.dateOfReleaseLabel.text = dateLoad()
    }
    
    private func dateLoad() -> String {
        guard let date = app.currentVersionReleaseDate else { return "" }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"

        let dateInDate = dateFormatterGet.date(from: date)
        return dateFormatterPrint.string(from: dateInDate!)
        
    }
    
}
