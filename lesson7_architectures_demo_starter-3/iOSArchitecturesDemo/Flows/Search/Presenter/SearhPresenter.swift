//
//  SearhPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 08.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: AnyObject {
    var searchAppResults: [ITunesApp] { get set }
    var searchSongResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(app: ITunesApp)
    func viewDidSelectSong(song: ITunesSong)
}

class SearchPresenter {
    weak var viewInput: (UIViewController & SearchViewInput)?
    private let searchService = ITunesSearchService()
    
    
    
    private func requestApps(with query: String) {
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchAppResults = apps
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }
    
    private func requestSongs(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchSongResults = songs
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    private func openSongDetails(with song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        viewInput?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}

extension SearchPresenter: SearchViewOutput {
    
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        
        if SearchingParameters.shared.segmentIndex == 0 {
            requestApps(with: query)
        } else {
            requestSongs(with: query)
        }
    }
    
    func viewDidSelectApp(app: ITunesApp) {
        openAppDetails(with: app)
    }
    
    func viewDidSelectSong(song: ITunesSong) {
        openSongDetails(with: song)
    }
    
    
    
}
