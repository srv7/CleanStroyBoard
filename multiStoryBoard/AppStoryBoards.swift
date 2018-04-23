//
//  AppStoryBoards.swift
//  multiStoryBoard
//
//  Created by liubo on 2018/4/23.
//  Copyright © 2018年 cloudist. All rights reserved.
//

import Foundation

enum Storyboards: String {
    case Main
    case Home
    case Feed
    case Account
}

extension Storyboard {
    static let Main = Storyboard(rawValue: Storyboards.Main.rawValue)
    static let Home = Storyboard(rawValue: Storyboards.Home.rawValue)
    static let Feed = Storyboard(rawValue: Storyboards.Feed.rawValue)
    static let Account = Storyboard(rawValue: "Account")
}
