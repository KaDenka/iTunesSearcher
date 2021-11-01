//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Denis Kazarin on 01.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SearchRouterInput {
    func openAppDetails(with app: ITunesApp)
    func openSongDetails(with song: ITunesSong)
}


class SearchRouter: SearchRouterInput {
    
    weak var viewController: UIViewController?
    
    func openAppDetails(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func openSongDetails(with song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
    
    
}
