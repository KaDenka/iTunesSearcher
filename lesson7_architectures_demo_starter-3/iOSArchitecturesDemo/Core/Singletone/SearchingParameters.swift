//
//  SearchingParameters.swift
//  iOSArchitecturesDemo
//
//  Created by Denis Kazarin on 22.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

final class SearchingParameters {
    
    static let shared = SearchingParameters()
    private init() {}
    
    var segmentIndex = 0
}
