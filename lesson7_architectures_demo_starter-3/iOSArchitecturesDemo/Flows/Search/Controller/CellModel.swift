//
//  AppCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import Foundation

struct AppCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

struct SongCellModel {
    let track: String
    let artist: String?
}

final class CellModelFactory {
    
    static func cellAppModel(from model: ITunesApp) -> AppCellModel {
        return AppCellModel(title: model.appName,
                            subtitle: model.company,
                            rating: model.averageRating >>- { "\($0)" })
    }
   
        static func cellSongModel(from song: ITunesSong) -> SongCellModel {
            return SongCellModel(track: song.trackName,
                                artist: song.artistName
                               )
    }
    
}
